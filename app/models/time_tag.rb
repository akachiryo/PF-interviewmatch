class TimeTag < ApplicationRecord

  has_many :rooms, dependent: :destroy

  validates :span, presence: true

end
