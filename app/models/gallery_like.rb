class GalleryLike < ApplicationRecord
  belongs_to :user
  belongs_to :gallery


  validates :user, presence: true
  validates :gallery, presence: true
  validates_uniqueness_of :gallery, scope: :user
end
