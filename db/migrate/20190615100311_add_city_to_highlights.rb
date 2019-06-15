class AddCityToHighlights < ActiveRecord::Migration[5.1]
  def change
  	add_column :highlights, :city, :string
  end
end
