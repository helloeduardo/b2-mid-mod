class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(name: params[:ride])
    MechanicRide.create!(mechanic: mechanic, ride: ride)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
