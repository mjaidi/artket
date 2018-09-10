class AddGalleryToArtists < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :gallery, foreign_key: true
  end
end
