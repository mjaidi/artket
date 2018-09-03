class Category < ApplicationRecord
  has_many :join_art_categories

  validates :name, presence: true
end
