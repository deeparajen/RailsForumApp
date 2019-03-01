class CommentsController < ApplicationController
  
  def index
    @post = Post.find(params[:post_id])
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment: params[:comment][:comment], user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.js
        flash[:notice] = "Comment was successfully created."
        #format.html { redirect_to posts_path, notice: 'Comment was successfully created.' }
      else
        format.html { render action: "index" }
      end
    end
  end
end
