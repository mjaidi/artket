class AddItemsToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
  end
end
