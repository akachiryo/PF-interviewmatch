class Tag < ApplicationRecord
  has_many :room_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :rooms, through: :room_tags

  validates :name, presence: true

  def self.search(keyword)
    where(['name like?', "%#{keyword}%"])
  end
end
