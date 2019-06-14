class AddSearchFieldsForUsers < ActiveRecord::Migration[5.1]
   def change
    add_column :users, :search_state, :text
    add_column :users, :search_city, :text 
    add_column :users, :search_area, :text
  end
end
