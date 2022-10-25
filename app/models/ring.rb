class Ring < ApplicationRecord
  belongs_to :user

  validates :finger_circumference, presence: true
end
