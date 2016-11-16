class BookingsController < ApplicationController
  before_action :set_guide, only: [:new, :create, :index]
  before_action :set_profile, only: [:new, :create, :edit]
  before_action :set_booking, only: [:destroy, :show]
  before_action :set_status_flow, only: [:show]

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
    @booking.total_price = @guide.daily_price * @booking.days
    @booking.end_date = @booking.start_date + @booking.days
    if @booking.save
      @booking.set_status_pending_payment
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
    redirect_to :back, notice: 'Booking was successfully destroyed.'
  end

  def payment

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

  def set_status_flow
    @status_flows = StatusFlow.where(booking_id: @booking.id).order(created_at: :desc)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :days, :meeting_time, :total_price)
  end
end
