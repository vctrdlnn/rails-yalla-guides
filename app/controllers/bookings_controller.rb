class BookingsController < ApplicationController
  before_action :set_guide, only: [:new, :create, :index]
  before_action :set_profile, only: [:new, :create, :edit]
  before_action :set_booking, only: [:destroy, :show]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = @guide.bookings.build(booking_params)
    @booking.profile_id = @profile.id
    @booking.status_id = Status.find_by_code(10).id
    if @booking.save
      redirect_to guide_booking_path(@guide, @booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    def set_guide
      @guide = Guide.find(params[:guide_id])
    end

    def set_profile
      # TODO: Add check if host profile doesn't exist
      @profile = Profile.where(user_id: current_user.id).where(role: "guest").first
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :total_price)
    end
end
