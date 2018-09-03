class ArtPhoto < ApplicationRecord
  belongs_to :artwork
  
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
