class Place < ApplicationRecord
  belongs_to :user
  belongs_to :continent

  mount_uploader :image, ImageUploader
end
