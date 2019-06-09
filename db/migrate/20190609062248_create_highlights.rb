class CreateHighlights < ActiveRecord::Migration[5.1]
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :date
      t.string :place

      t.timestamps
    end
  end
end
