class PlacesController < ApplicationController

before_action :find_place, only: [:show, :edit, :update, :destroy]

  def index
    @place = Place.all.order("created_at DESC")
  end

  def show
  end

  def new
    @place = current_user.places.build
    @continents = Continent.all.map{|c| [c.name, c.id]}
    @countries = Country.all.map{|c| [c.countryname, c.id]}
  end

  def create
    @place = current_user.places.build(place_params)
    @continents.continent_id = params[:continent_id]
    @countries.country_id = params[:country_id]
    if @place.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @continents = Continent.all.map{|c| [c.name, c.id]}
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to root_path
  end

private

  def place_params
    params.require(:place).permit(:continent, :country, :city, :description, :continent_id, :country_id)
  end

  def find_place
   @place = Place.find(params[:id])
 end

end
