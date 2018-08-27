class AddCommentsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :comment_ids, :integer
    add_index :posts, :comment_ids
    add_column :posts, :comment, :string
  end
end
