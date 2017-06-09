class AddColumnsToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :line1, :string, limit: 50, null: false, default: ""
    add_column :addresses, :line2, :string, limit: 50
    add_column :addresses, :city, :string, limit: 50, null: false, default: ""
  end
end
