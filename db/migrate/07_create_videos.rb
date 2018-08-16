class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :post_id
      t.text :body
      t.text :embed_link
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :videos, :post_id
  end
end
