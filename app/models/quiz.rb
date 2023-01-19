class Quiz < ApplicationRecord
  belongs_to :user

  validates :question, presence: true
  validates :choice_1, presence: true
  validates :choice_2, presence: true
  validates :choice_3, presence: true
  validates :choice_4, presence: true
  validates :answer, presence: true
end
