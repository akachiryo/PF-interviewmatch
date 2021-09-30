class UserRoom < ApplicationRecord
  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :room

  def self.create_notification_user_room(current_user, user, user_room)
    # すでに「いいね」されているか検索
    temp = Notification.where(visiter_id: current_user.id, visited_id: user.id, user_room_id: user_room.id,
                              action: 'user_room')
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = Notification.new(visiter_id: current_user.id, visited_id: user.id, user_room_id: user_room.id,
                                      action: 'user_room')
      # 自分の投稿に対するいいねの場合は、通知済みとする
      notification.checked = true if notification.visiter_id == notification.visited_id
      notification.save if notification.valid?
    end
  end
end
