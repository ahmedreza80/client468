class AddReferencesToRegisterationNumbers < ActiveRecord::Migration[5.1]
  def change
  	add_column :registeration_numbers, :shop_id, :string
  end
end
