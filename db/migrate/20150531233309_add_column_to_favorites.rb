class AddColumnToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :folder_id, :integer
    add_index :favorites, :folder_id
  end
end
