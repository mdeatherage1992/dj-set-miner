class AddAudienceToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :audience, :integer
  end
end
