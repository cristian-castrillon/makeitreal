class RemoveAddressFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :address, :string
  end
end
