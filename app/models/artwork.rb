class Artwork < ApplicationRecord
  include PgSearch

  belongs_to :gallery
  belongs_to :exhibition, optional: true
  belongs_to :artist
  has_many :art_photos, dependent: :destroy
  has_many :join_art_categories, dependent: :destroy
  has_many :categories, through: :join_art_categories
  has_many :artwork_likes

  validates :name, presence: true
  validates :gallery, presence: true
  validates :artist, presence: true

  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      artist: [ :first_name, :last_name ],
      gallery:[ :name, :full_address],
      categories:[:name]
    },
    using: {
      tsearch: { prefix: true, :any_word => true }
    }

  def label_artwork
    "#{name}, #{artist.first_name} #{artist.last_name}, #{year}"
  end
end
