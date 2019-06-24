class AddRepeatToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :repeat, :string
  end
end
