class AddSocialToShop < ActiveRecord::Migration[5.1]
  def change
  	add_column :shops, :facebook, :string
    add_column :shops, :twitter, :string
    add_column :shops, :linkedin, :string
  end
end
