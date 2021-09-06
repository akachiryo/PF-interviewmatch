class Room < ApplicationRecord

  belongs_to :user
  belongs_to :time_tag
  belongs_to :ocuupation_tag
end
