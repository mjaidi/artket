class JoinArtCategory < ApplicationRecord
  belongs_to :artwork
  belongs_to :category
end
