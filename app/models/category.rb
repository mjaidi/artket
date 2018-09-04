class Category < ApplicationRecord
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "parent_id"
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  has_many :join_art_categories

  validates :name, presence: true
end
