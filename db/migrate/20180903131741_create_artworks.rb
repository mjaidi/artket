class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :dimensions
      t.float :price
      t.references :gallery, foreign_key: true
      t.references :exhibition, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
