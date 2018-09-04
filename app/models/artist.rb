class Artist < ApplicationRecord
  has_many :artworks

  mount_uploader :photo, PhotoUploader
  
  validates :first_name, presence: :true
end
