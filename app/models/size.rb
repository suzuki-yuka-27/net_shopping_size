class Size < ApplicationRecord
  belongs_to :user
  has_many :tops, dependent: :destroy
  has_many :bottoms, dependent: :destroy

  validates :title, presence: true
end
