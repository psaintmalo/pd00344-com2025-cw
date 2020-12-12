class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :useranme, :string
    add_index :users, :useranme, unique: true
  end
end
