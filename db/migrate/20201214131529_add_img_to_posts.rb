class AddImgToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :img, :string, null: true
  end
end
