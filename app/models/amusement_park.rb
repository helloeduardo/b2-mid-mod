class AmusementPark < ApplicationRecord
  has_many :rides

  def average_ride_thrill
    rides.average(:thrill)
  end
end
