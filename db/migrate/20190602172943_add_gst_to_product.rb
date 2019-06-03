class AddGstToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :gst, :string
  end
end
