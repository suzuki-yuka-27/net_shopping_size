class Top < ApplicationRecord
  belongs_to :size

  validates :neck, presence: true
  validates :shoulder_width, presence: true
  validates :body_width, presence: true
  validates :body_length, presence: true
  validates :sleeve_length, presence: true
  validates :shoulder_width, presence: true
end
