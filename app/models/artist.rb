class Artist < ApplicationRecord
  has_many :artworks
  
  validates :first_name, presence: :true
end
