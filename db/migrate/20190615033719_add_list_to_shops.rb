class AddListToShops < ActiveRecord::Migration[5.1]
  def change
  	add_column :shops, :list, :string
  end
end
