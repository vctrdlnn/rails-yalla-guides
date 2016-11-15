class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
  end

  def create
    @review = @booking.reviews.build(review_params)
    if review.save
      redirect_to @booking
    else
      render :new
    end
  end

  def edit

  end

  def update
    @review = @booking.reviews.build(review_params)
    if review.update
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @booking
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end



