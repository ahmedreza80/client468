class AddProductIdToPreviews < ActiveRecord::Migration[5.1]
  def change
    add_column :previews, :product_id, :integer
  end
end
