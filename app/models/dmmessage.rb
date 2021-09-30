class Dmmessage < ApplicationRecord
  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :dmroom

  validates :content, presence: true

  def self.create_notification_dmmessage(current_user, user, dmmessage)
    temp = Notification.where(visiter_id: current_user.id, visited_id: user.id, dmmessage_id: dmmessage.id,
                              action: 'dmmessage')
    if temp.blank?
      notification = Notification.new(visiter_id: current_user.id, visited_id: user.id, dmmessage_id: dmmessage.id,
                                      action: 'dmmessage')
      notification.checked = true if notification.visiter_id == notification.visited_id
      notification.save if notification.valid?
    end
  end
end
