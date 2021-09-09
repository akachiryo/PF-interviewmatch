class Dmroom < ApplicationRecord

  has_many :dmmessages, dependent: :destroy
  has_many :entries, dependent: :destroy

end
