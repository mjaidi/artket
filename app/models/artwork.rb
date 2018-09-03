class Artwork < ApplicationRecord
  belongs_to :gallery
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_photos
  has_many :join_art_categories
  has_many :categories, through: :join_art_categories

  validates :name, presence: true
  validates :gallery, presence: true
  validates :artist, presence: true
end
