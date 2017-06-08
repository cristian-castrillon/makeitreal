class ChangeUsernameFromUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, limit: 50, null: false
  end
end
