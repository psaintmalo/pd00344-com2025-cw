class MakePostsTextNullable < ActiveRecord::Migration[5.2]
  def change

    change_column :posts, :text, :text, null: true

  end
end
