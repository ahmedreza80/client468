class AddShopnameToRegisterationNumbers < ActiveRecord::Migration[5.1]
  def change
  	add_column :registeration_numbers, :shop_name, :string
  end
end
