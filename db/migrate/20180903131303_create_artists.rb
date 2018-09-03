class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.date :birth_date
      t.date :death_date

      t.timestamps
    end
  end
end
