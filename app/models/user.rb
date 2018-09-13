class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :galleries
  has_many :artists
  has_many :artwork_likes
  has_many :gallery_likes
  has_many :conversations
  has_many :messages, through: :conversations

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
