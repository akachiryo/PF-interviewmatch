class RoomChat < ApplicationRecord
  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :room

  def self.create_notification_room_chat(current_user, user, room_chat)
    temp = Notification.where(visiter_id: current_user.id, visited_id: user.id, room_chat_id: room_chat.id,
                              action: 'room_chat')
    if temp.blank?
      notification = Notification.new(visiter_id: current_user.id, visited_id: user.id, room_chat_id: room_chat.id,
                                      action: 'room_chat')
      notification.checked = true if notification.visiter_id == notification.visited_id
      notification.save if notification.valid?
    end
  end
end
