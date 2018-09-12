class Gallery < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  has_many :artworks
  has_many :exhibitions
  has_many :artists, through: :artworks
  has_many :gallery_likes

  mount_uploader :photo, PhotoUploader


  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :address_line, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :full_address, uniqueness: true

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_full_address?

  before_validation do
    self.full_address = "#{address_line}, #{city}, #{country}"
  end

  algoliasearch do
    # all attributes will be sent
  end
end 
