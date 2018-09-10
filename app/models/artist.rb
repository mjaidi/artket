class Artist < ApplicationRecord
  include AlgoliaSearch
  has_many :artworks
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  
  validates :first_name, presence: :true
  validates_uniqueness_of :first_name, scope: :last_name
  add_index :artists, [ :first_name, :last_name ], unique: true

  algoliasearch do
    # all attributes will be sent
  end
end
