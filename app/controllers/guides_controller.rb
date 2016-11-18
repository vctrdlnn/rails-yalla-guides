class GuidesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_guide, only: [:show, :update, :destroy, :edit]
  before_action :set_profile, only: [:new, :create, :edit, :update, :destroy]

  def index
    @disable_footer = true
    @guides = Guide.where.not(latitude: nil, longitude: nil)
    set_hash(@guides)
  end

  def show
    @booking = Booking.new
    @owner = owner?
    @guide_coordinates = {lat: @guide.latitude, lon: @guide.longitude}

    @step = Step.new
    @step_coordinates = { lat: @step.latitude, lng: @step.longitude }
    @steps = @guide.steps
    @hash = Gmaps4rails.build_markers(@steps) do |step, marker|
      marker.lat step.latitude
      marker.lng step.longitude
      marker.infowindow render_to_string(partial: "/steps/map_box", locals: { step: step })
    end
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.profile_id = @profile.id
    if @guide.save
      redirect_to @guide, notice: 'Guide was successfully created.'
    else
      render :new
    end
  end

  def edit

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
    redirect_to guides_path , notice: 'Guide was successfully destroyed.'
  end

  def search
    @disable_footer = true
    @guides = Guide.near(params["guide"]["address"], 20)
    set_hash(@guides)
    render :index
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def set_hash(guides)
    @hash = Gmaps4rails.build_markers(@guides) do |guide, marker|
      marker.lat guide.latitude
      marker.lng guide.longitude
      marker.infowindow render_to_string(partial: "/guides/map_box", locals: { guide: guide })
    end
  end

  def guide_params
    params.require(:guide).permit(:title, :description, :address, :city,
     :photo, :photo_cash, :daily_price, :category, :profile_id)
  end

  def owner?
    current_user.id == @guide.profile.user.id
  end

end
