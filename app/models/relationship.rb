class Relationship < ApplicationRecord

   belongs_to :user
   belongs_to :follow, class_name: "User"

   validates :user_id, presence: true
   validates :follow_id, presence: true

   def self.create_notification_follow(current_user, user)
     temp = Notification.where(visiter_id: current_user.id, visited_id: user.id, action: "follow")
     if temp.blank?
       notification = Notification.new(visiter_id: current_user.id, visited_id: user.id, action: "follow")
       if notification.visiter_id == notification.visited_id
         notification.checked = true
       end
       notification.save if notification.valid?
     end
   end
end
