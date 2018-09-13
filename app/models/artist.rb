class Artist < ApplicationRecord
  include AlgoliaSearch
  has_many :artworks
  belongs_to :user
  has_many :artist_likes

  mount_uploader :photo, PhotoUploader

  validates :first_name, presence: :true
  validates_uniqueness_of :first_name, scope: :last_name

  algoliasearch do
    # all attributes will be sent
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
