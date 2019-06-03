class AddUserIdToPreviews < ActiveRecord::Migration[5.1]
  def change
    add_column :previews, :user_id, :integer
  end
end
