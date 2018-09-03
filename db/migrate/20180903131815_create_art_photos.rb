class CreateArtPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :art_photos do |t|
      t.string :photo
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
