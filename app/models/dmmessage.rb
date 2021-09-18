class Dmmessage < ApplicationRecord

  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :dmroom

  validates :content, presence: true

  def self.create_notification_dmmessage(current_user, user, dmmessage)
    # すでに「いいね」されているか検索
    temp = Notification.where(visiter_id: current_user.id, visited_id: user.id, dmmessage_id: dmmessage.id, action: "dmmessage")
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = Notification.new(visiter_id: current_user.id, visited_id: user.id, dmmessage_id: dmmessage.id, action: "dmmessage")
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end
