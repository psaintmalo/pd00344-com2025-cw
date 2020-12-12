class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :post, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end

    add_index :bookmarks, [:post_id, :user_id]

  end
end
