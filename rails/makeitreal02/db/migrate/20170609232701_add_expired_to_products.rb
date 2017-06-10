class AddExpiredToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :expired, :boolean, default: false
  end
end
