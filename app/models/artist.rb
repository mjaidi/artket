class Artist < ApplicationRecord
  has_many :artworks
  belongs_to :user
  has_many :artist_likes, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :first_name, presence: :true
  validates_uniqueness_of :first_name, scope: :last_name


  def full_name
    "#{first_name} #{last_name}"
  end
end
