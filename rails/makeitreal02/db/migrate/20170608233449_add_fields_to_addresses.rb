class AddFieldsToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :zip, :integer
    add_column :addresses, :country, :string
    add_column :addresses, :line, :integer
  end
end
