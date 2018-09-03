class ArtPhoto < ApplicationRecord
  belongs_to :artwork
  
  validates :photo, presence: true
end
