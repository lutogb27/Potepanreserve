class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reservations

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  mount_uploader :User_icon, UserIconUploader
end
