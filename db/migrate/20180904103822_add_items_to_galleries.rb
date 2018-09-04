class AddItemsToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :address_line, :string
    add_column :galleries, :city, :string
    add_column :galleries, :country, :string
  end
end
