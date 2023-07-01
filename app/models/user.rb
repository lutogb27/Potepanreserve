class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reserves
  has_many :reserve_rooms, through: :reserves, source: :room
  has_one_attached :User_icon

  mount_uploader :User_icon, UserIconUploader
  
  validates :User_icon, :introduction, presence: true, on: :update
end
