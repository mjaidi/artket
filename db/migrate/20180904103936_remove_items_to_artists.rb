class RemoveItemsToArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :name
  end
end
