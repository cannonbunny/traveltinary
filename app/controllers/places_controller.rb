class PlacesController < ApplicationController

  def index
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
  end

private

  def place_params
    params.require(:place).permit(:continent, :country, :city, :description)
  end

end
