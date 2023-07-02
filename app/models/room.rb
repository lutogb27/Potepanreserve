class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user

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
