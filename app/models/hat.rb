class Hat < ApplicationRecord
  belongs_to :user

  validates :head_circumference, presence: true
end
