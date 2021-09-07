class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :image

   has_many :rooms, dependent: :destroy
   has_many :user_rooms, dependent: :destroy
   has_many :room_chats, dependent: :destroy

end
