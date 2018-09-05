class Artist < ApplicationRecord
  include AlgoliaSearch

  has_many :artworks

  mount_uploader :photo, PhotoUploader
  
  validates :first_name, presence: :true

  algoliasearch do
    # all attributes will be sent
  end
end
