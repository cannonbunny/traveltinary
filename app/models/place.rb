class Place < ApplicationRecord
  belongs_to :user
  belongs_to :continent
  belongs_to :country
end
