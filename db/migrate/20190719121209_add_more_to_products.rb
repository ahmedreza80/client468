class AddMoreToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :imagefour, :string
  	add_column :products, :imagefive, :string
  end
end
