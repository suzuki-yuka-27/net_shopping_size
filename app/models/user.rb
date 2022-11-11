class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :top, dependent: :destroy
  has_one :bottom, dependent: :destroy
  has_one :hat, dependent: :destroy
  has_one :ring, dependent: :destroy
  has_one :one_piece, dependent: :destroy
  has_one :outer, dependent: :destroy
  has_one :underwear, dependent: :destroy
end
