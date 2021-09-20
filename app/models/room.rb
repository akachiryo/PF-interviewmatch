class Room < ApplicationRecord

  has_many :user_rooms, dependent: :destroy
  has_many :room_chats, dependent: :destroy

  belongs_to :user
  belongs_to :time_tag
  belongs_to :ocuupation_tag

  validates :title, presence: true
  validates :content, presence: true
  validates :time_tag_id, presence: true
  validates :ocuupation_tag_id, presence: true
end
