class RemoveLineFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :line, :integer
  end
end
