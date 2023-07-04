class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user,optional: true

  mount_uploader :room_image, RoomImageUploader 

  validates :room_name, :introduction, :address, presence: true
  validates :fee , presence: true , numericality: { greater_than_or_equal_to: 0 }

  def self.search(keyword)
    if keyword != ""
      Room.where('room_name LIKE ? OR introduction LIKE ? OR address LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    else
      Room.all
    end
  end

  def self.search(key)
    if key != ""
      Room.where('address LIKE ?', "%#{key}%")
    else
      Room.all
    end
  end

  def self.search(word)
    if word != ""
      Room.where('room_name LIKE ? OR introduction LIKE ?', "%#{word}%",  "%#{word}%")
    else
      Room.all
    end
  end
end
