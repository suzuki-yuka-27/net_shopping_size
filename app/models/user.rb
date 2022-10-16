class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tops, dependent: :destroy
  has_many :bottoms, dependent: :destroy
  has_many :hats, dependent: :destroy


  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true
end
