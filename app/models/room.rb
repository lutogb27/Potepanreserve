class Room < ApplicationRecord
  has_many :reserves
  belongs_to :user
  has_many :reserve_users, through: :reserves, source: :user

  mount_uploader :room_image, RoomImageUploader 

  validates :room_name, :introduction, :price, :address, :room_image, presence: true

  def self.search(keyword)
    if keyword != ""
      Room.where('room_name LIKE ? OR introduction LIKE ? OR address LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    else
      Room.all
    end
  end
end
