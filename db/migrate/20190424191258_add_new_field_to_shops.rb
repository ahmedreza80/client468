class AddNewFieldToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :state, :string
    add_column :shops, :city, :string
    add_column :shops, :area, :string
    add_column :shops, :operating_hours, :string
  end
end
