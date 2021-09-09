class Room < ApplicationRecord

  has_many :user_rooms, dependent: :destroy
  has_many :room_chats, dependent: :destroy

  belongs_to :user
  belongs_to :time_tag
  belongs_to :ocuupation_tag
end
