class AddBrandDetailsToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :brand, :string
  	add_column :products, :ram, :string
  	add_column :products, :storage, :string
  end
end
