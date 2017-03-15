class Sighting < ApplicationRecord
  belongs_to :animal
  validates :date, :reccurence, :latitude, :longitude, :region, presence: true
end
