class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_one :top, dependent: :destroy
  has_one :bottom, dependent: :destroy
  has_one :hat, dependent: :destroy
  has_one :ring, dependent: :destroy
  has_one :one_piece, dependent: :destroy
  has_one :outer, dependent: :destroy
  has_one :underwear, dependent: :destroy

  enum role: { general: 0, admin: 1 }
end
