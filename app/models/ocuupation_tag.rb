class OcuupationTag < ApplicationRecord

  has_many :rooms, dependent: :destroy

end
