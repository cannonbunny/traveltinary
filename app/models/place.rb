class Place < ApplicationRecord
  belongs_to :user
  belongs_to :continent
  has_many :reviews

  mount_uploader :image, ImageUploader
end
