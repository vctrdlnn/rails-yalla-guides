class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :update, :destroy, :edit]
  before_action :set_profile, only: [:new, :create, :edit, :update, :destroy]

  def index
    @guides = Guide.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@guides) do |guide, marker|
    marker.lat guide.latitude
    marker.lng guide.longitude
    marker.infowindow render_to_string(partial: "/guides/map_box", locals: { guide: guide })
    end
  end

  def show
    @guide_coordinates = {lat: @guide.latitude, lon: @guide.longitude}
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

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:title, :description, :address, :city,
     :photo, :photo_cash, :daily_price, :category)
  end
end
