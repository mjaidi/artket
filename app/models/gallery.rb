class Gallery < ApplicationRecord
  belongs_to :user
  has_many :artworks
  has_many :exhibitions
  has_many :artists, through: :artworks

  validates :user, presence: true
  validates :name, presence: true
  validates :full_address, presence: true
end
