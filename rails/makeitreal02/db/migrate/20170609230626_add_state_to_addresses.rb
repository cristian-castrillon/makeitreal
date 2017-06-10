class AddStateToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :state, :string
  end
end
