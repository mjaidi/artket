class ArtistLike < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  validates :user, presence: true
  validates :artist, presence: true
  validates_uniqueness_of :artist, scope: :user

end
