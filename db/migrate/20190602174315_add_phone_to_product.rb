class AddPhoneToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :phone, :string
  end
end
