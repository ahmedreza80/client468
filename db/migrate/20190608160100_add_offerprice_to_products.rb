class AddOfferpriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :offerprice, :integer
  end
end
