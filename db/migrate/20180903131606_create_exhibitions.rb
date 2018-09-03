class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :cover_photo
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
