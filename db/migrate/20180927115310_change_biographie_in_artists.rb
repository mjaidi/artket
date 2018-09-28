class ChangeBiographieInArtists < ActiveRecord::Migration[5.2]
  def change
    change_column :artists, :biographie, :text
  end
end
