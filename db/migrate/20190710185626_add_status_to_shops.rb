class AddStatusToShops < ActiveRecord::Migration[5.1]
  def change
  	add_column :shops, :status, :string
  end
end
