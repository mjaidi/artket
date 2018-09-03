class Exhibition < ApplicationRecord
  belongs_to :gallery
  has_many :artworks
end
