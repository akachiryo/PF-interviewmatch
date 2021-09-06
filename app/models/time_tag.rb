class TimeTag < ApplicationRecord

  has_many :rooms, dependent: :destroy

end
