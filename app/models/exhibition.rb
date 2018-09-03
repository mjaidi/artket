class Exhibition < ApplicationRecord
  belongs_to :gallery
  has_many :artworks

  validates :name, presence: true
  validates :gallery, presence: true
end
