class AddNewFieldsToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :total, :string
    add_column :orders, :quantity, :string
  end
end
