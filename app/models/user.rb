class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :image

   has_many :rooms, dependent: :destroy
   has_many :user_rooms, dependent: :destroy
   has_many :room_chats, dependent: :destroy
   has_many :relationships
   has_many :followings, through: :relationships, source: :follow
   has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
   has_many :followers, through: :reverse_of_relationships, source: :user

   def following?(other_user)
     self.followings.include?(other_user)
   end


end
