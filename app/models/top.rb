class Top < ApplicationRecord
  belongs_to :user

  validates :neck, presence: true
  validates :shoulder_width, presence: true
  validates :body_width, presence: true
  validates :body_length, presence: true
  validates :sleeve_length, presence: true
  validates :shoulder_width, presence: true

  attribute :neck, :float, default: 0
  attribute :shoulder_width, :float, default: 0
  attribute :body_width, :float, default: 0
  attribute :body_length, :float, default: 0
  attribute :sleeve_length, :float, default: 0
  attribute :shoulder_width, :float, default: 0
end
