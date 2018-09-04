class Exhibition < ApplicationRecord
  belongs_to :gallery
  has_many :artworks

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_is_after_start_date
  
  mount_uploader :cover_photo, PhotoUploader


  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date") 
    end 
  end
end
