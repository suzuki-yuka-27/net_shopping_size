class Material < ApplicationRecord
  mount_uploader :material_image, MaterialImageUploader
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
end
