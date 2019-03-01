class AddNameColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :default => "",:null => false
    add_index  :users, :name
  end
end
