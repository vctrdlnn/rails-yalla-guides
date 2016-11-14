class BookingsController < ApplicationController
  before_action :set_guide, only: [:new, :create, :index]
  before_action :set_profile, only: [:new, :edit]
  before_action :set_booking, only: [:destroy]

  def index
    @guides = Guide.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @guide = Guide.new
  end

  def edit
  end

  def create
    @guide = Guide.new(guide_params)

    if @guide.save
      redirect_to @guide, notice: 'Guide was successfully created.' }
    else
      render :new
    end
  end

  def update
    if @guide.update(guide_params)
      redirect_to @guide, notice: 'Guide was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @guide.destroy
    redirect_to guides_url, notice: 'Guide was successfully destroyed.'
  end

  private
    def set_guide
      @guide = Guide.find(params[:guide_id])
    end

    def set_profile
      # TODO: verifier la definition du profile
    end

    def guide_params
      params.require(:guide).permit(:start_date, :end_date, :total_price)
    end
end
