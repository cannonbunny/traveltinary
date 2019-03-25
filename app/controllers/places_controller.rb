class PlacesController < ApplicationController

before_action :find_place, only: [:show, :edit, :update, :destroy]

  def index
    @place = Place.all.order("created_at DESC")
  end

  def show
  end

  def new
    @place = current_user.place.build
  end

  def create
    @place = current_user.place.build(place_params)
    if @place.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
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
    params.require(:place).permit(:continent, :country, :city, :description)
  end

  def find_place
   @place = Place.find(params[:id])
 end

end
