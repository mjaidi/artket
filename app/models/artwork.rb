class Artwork < ApplicationRecord
  belongs_to :gallery
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_photos
  has many :join_art_categories
  has many :categories, though: :join_art_categories

  validates :name, presence: true
  validates :gallery, presence: true
  validates :artist, presence: true
end
