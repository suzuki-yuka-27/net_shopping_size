class Ring < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 10 }
  validates :finger_circumference, presence: true
end
