class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tops, dependent: :destroy
  has_many :bottoms, dependent: :destroy
  has_many :hats, dependent: :destroy
  has_many :rings, dependent: :destroy
  has_many :one_pieces, dependent: :destroy
  has_many :outers, dependent: :destroy
  has_many :underwears, dependent: :destroy

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true
  validates :line_user_id, presence: true, uniqueness: true
end
