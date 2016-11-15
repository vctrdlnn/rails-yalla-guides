class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :update, :destroy, :edit]
  before_action :set_profile, only: [:new, :create, :edit, :update, :destroy]

  def index
    @guides = Guide.all
  end

  def show

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
    params.require(:guide).permit(:title, :description, :start_address, :end_address, :city,
     :photo, :photo_cash, :hourly_price, :category)
  end
end
