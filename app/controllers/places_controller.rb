class PlacesController < ApplicationController

before_action :find_place, only: [:show, :edit, :update, :destroy]
before_action :find_continent, only: [:new, :create, :edit]

  def index
    @place = Place.all.order("created_at DESC")
  end

  def show
  end

  def new
    @place = current_user.places.build
  end

  def create
    @place = current_user.places.build(place_params)
    @place.continent_id = params[:continent_id]
    if @place.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @place.continent_id = params[:continent_id]

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
    params.require(:place).permit( :city, :description, :continent_id)
  end

  def find_continent
    @continents = Continent.all.map{|c| [c.name, c.id]}
  end

  def find_place
   @place = Place.find(params[:id])
 end

end
