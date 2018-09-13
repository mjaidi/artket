class CreateArtistLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_likes do |t|
      t.references :artist, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
