class OnePiece < ApplicationRecord
  belongs_to :user

  validates :neck, presence: true
  validates :shoulder_width, presence: true
  validates :bust, presence: true
  validates :waist, presence: true
  validates :hip, presence: true
  validates :body_length, presence: true
  validates :sleeve_length, presence: true
  validates :sleeve_width, presence: true
end
