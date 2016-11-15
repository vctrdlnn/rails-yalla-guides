class GuidesController < ApplicationController
  before_action :find_guide, only: [:show, :update, :destroy, :edit]

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
    @guide.profile_id = 1
    if @guide.save
      redirect_to @guide
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @guide.update(guide_params)
      redirect_to @guide
    else
      render :edit
    end
  end

  def destroy
    @guide.destroy
    redirect_to @guides_path # TODO: check this path
  end

  private

  def find_guide
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:title, :description, :start_address, :end_address, :city,
     :photo, :photo_cash, :hourly_price, :category)
  end
end
