class ChangeColumnsFromAddresses < ActiveRecord::Migration[5.1]
  def change
    change_column :addresses, :zip, :string, limit: 10, null: false, default: ""
    change_column :addresses, :country, :string, limit: 2, null: false, default: ""
  end
end
