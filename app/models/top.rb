class Top < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 10 }
  validates :neck, presence: true
  validates :shoulder_width, presence: true
  validates :body_width, presence: true
  validates :body_length, presence: true
  validates :sleeve_length, presence: true
  validates :sleeve_width, presence: true
end
