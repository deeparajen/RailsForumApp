class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,:like]
  before_action :authenticate_user!, except: [:index]

  # GET /posts
  def index
    @posts = Post.page(params[:page]).per(3)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
  @post = Post.new(post_params) do |post|
    post.user = current_user
  end
  if @post.save
    redirect_to posts_path
  else
    redirect_to posts_path, notice: @post.errors.full_messages.first
  end
 end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end
  
  def like
    @post = Post.find(params[:id])
    @post_id = @post.id
    @post.liked_by current_user
    @thumbs_up = @post.get_upvotes.size
    puts @thumbs_up.inspect
    puts "*********************************"
    respond_to do |format|
        flash.now[:success] = "Like Success" 
        format.js
    end
    #render layout: false
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:attachment, :content, :user_id)
    end
end
