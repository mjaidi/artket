class AddTimestampsToArtworkLikes < ActiveRecord::Migration[5.2]
  def change
    change_table :artwork_likes do |t|
      t.timestamps
    end
  end
end
