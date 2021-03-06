class ArtworkLike < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :user, presence: true
  validates :artwork, presence: true
  validates_uniqueness_of :artwork, scope: :user

end
