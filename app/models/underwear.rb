class Underwear < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 10 }
  validates :top_bust, presence: true
  validates :under_bust, presence: true
  validates :waist, presence: true
  validates :hip, presence: true
end
