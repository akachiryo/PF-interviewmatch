class OcuupationTag < ApplicationRecord

  has_many :rooms, dependent: :destroy

  validates :name, presence: true

end
