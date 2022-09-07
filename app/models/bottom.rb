class Bottom < ApplicationRecord
  belongs_to :user

  validates :waist, presence: true
  validates :hip, presence: true
  validates :rising_length, presence: true
  validates :inseam, presence: true
  validates :total_length, presence: true
  validates :thickness_of_thigh, presence: true
  validates :bottom_width, presence: true

  attribute :waist, :float, default: 0.0
  attribute :hip, :float, default: 0.0
  attribute :rising_length, :float, default: 0.0
  attribute :inseam, :float, default: 0.0
  attribute :total_length, :float, default: 0.0
  attribute :thickness_of_thigh, :float, default: 0.0
  attribute :bottom_width, :float, default: 0.0
end
