class AddPublishedToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :published, :boolean, default: false
  end
end
