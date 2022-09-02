class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :sizes, dependent: :destroy
  has_many :tops, through: :sizes
  has_many :bottoms, through: :sizes

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
end
