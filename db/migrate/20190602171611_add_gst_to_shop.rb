class AddGstToShop < ActiveRecord::Migration[5.1]
  def change
  	add_column :shops, :gst, :string
  end
end
