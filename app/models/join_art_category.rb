class JoinArtCategory < ApplicationRecord
  belongs_to :artwork
  belongs_to :category

  validates :artwork, presence: true
  validates :category, presence: true
end
