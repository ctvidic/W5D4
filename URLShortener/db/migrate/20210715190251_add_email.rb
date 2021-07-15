class AddEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :text, null: false
    add_timestamps :users
    add_index :users, :email, unique: true
  end
end
