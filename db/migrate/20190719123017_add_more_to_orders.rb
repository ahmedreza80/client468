class AddMoreToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :state, :string
  	add_column :orders, :area, :string
  end
end
