class Tag < ApplicationRecord

  has_many :room_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :rooms, through: :room_tags

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end
