class Place < ApplicationRecord
  belongs_to :user
  belongs_to :continent
  has_many :reviews
  acts_as_votable
  mount_uploader :image, ImageUploader

  def score
  self.get_upvotes.size - self.get_downvotes.size
  end
end
