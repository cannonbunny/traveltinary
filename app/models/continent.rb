class Continent < ApplicationRecord
  has_many :countries
  has_many :places
end
