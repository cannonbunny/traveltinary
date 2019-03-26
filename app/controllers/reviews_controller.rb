class ReviewsController < ApplicationController

  before_action :find_place, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_review, only: [ :edit, :update, :destroy]

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      @review.place_id = @place.id
      @review.user_id = current_user.id

      if @review.save
        redirect_to place_path(@place)
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @review.update(review_params)
        redirect_to place_path(@place)
      else
        render 'edit'
      end
    end

    def destroy
      @review.destroy
      redirect_to place_path(@place)
    end

  private

    def review_params
      params.require(:review).permit( :vote, :comment)
    end

    def find_review
     @review = Review.find(params[:id])
    end

    def find_place
     @place = Place.find(params[:place_id])
    end

end
