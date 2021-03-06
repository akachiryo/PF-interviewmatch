class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :room_chats, dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :tags, through: :room_tags

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      tags << new_tag
    end
  end
end
