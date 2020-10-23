class AmusementParksController < ApplicationController
  def show
    @ap = AmusementPark.find(params[:id])
  end
end
