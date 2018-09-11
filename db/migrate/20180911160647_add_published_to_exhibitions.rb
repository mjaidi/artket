class AddPublishedToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :published, :boolean, default: false
  end
end
