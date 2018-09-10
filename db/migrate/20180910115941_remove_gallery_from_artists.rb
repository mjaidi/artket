class RemoveGalleryFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :gallery_id
  end
end
