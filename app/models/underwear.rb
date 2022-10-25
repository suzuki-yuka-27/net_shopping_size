class Underwear < ApplicationRecord
  belongs_to :user

  validates :top_bust, presence: true
  validates :under_bust, presence: true
  validates :waist, presence: true
  validates :hip, presence: true
end
