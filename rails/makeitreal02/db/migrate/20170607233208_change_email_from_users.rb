class ChangeEmailFromUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email, :string, limit: 50, null: false
  end
end
