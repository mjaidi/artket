class AddBiographieToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :biographie, :string
  end
end
