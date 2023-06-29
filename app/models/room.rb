class Room < ApplicationRecord
  validates :image, presence: true
  validates :name , presence: true
  validates :address , presence: true
  validates :price , presence: true , numericality: { greater_than_or_equal_to: 0 }

  def self.search(keyword)
    if keyword != ""
      Room.where('room_name LIKE ? OR introduction LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Room.all
    end
  end
end
