class CreateGalleryLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_likes do |t|
      t.references :user, foreign_key: true
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
