class PlacesController < ApplicationController

before_action :find_place, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
before_action :find_continent, only: [:new, :create, :edit]
before_action :find_activity, only: [:new, :create, :edit]

  def index
    if params[:continent].blank?
      if params[:activity].blank?
        @place = Place.all.order("created_at DESC")
      else
        @place = Place.where(:activity_id => Activity.find_by(activityname: params[:activity]).id).order("created_at DESC")
      end
    else
      if params[:continent]
        @place = Place.where(:continent_id => Continent.find_by(name: params[:continent]).id).order("created_at DESC")
      end
    end
  end

  def show
  end

  def new
    @place = current_user.places.build
  end

  def create
    @place = current_user.places.build(place_params)
    @place.continent_id = params[:continent_id]
    @place.activites_id = params[:activites_id]
    if @place.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @place.continent_id = params[:continent_id]
    @place.activites_id = params[:activites_id]
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

  def upvote
    @place.upvote_by current_user
    redirect_to place_path(@place)
  end

  def downvote
    @place.downvote_by current_user
    redirect_to place_path(@place)
  end

private

  def place_params
    params.require(:place).permit( :city, :description, :continent_id, :image)
  end

  def find_continent
    @continents = Continent.all.map{|c| [c.name, c.id]}
  end

  def find_activity
    @activities = Activity.all.map{|a| [a.activityname, a.id]}
  end

  def find_place
   @place = Place.find(params[:id])
 end

end
