class Bottom < ApplicationRecord
  belongs_to :size

  validates :waist, presence: true
  validates :hip, presence: true
  validates :rising_length, presence: true
  validates :inseam, presence: true
  validates :total_length, presence: true
  validates :thickness_of_thigh, presence: true
  validates :bottom_width, presence: true
end
