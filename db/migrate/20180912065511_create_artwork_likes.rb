class CreateArtworkLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_likes do |t|
      t.references :user, foreign_key: true
      t.references :artwork, foreign_key: true
    end
  end
end
