class AddItemsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :parent
  end
end
