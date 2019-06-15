class AddLocationToHighlights < ActiveRecord::Migration[5.1]
  def change
  	add_column :highlights, :state, :string
  	add_column :highlights, :area, :string
  end
end
