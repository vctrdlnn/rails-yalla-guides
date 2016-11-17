class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :set_guide, only: [:new, :create, :edit, :update]

  def index
    @steps = Step.all
  end

  def show
    # @step_coordinates = { lat: @step.latitude, lng: @step.longitude }
  end

  def new
    @step = Step.new
  end

  def edit

  end

  def create
    @step = @guide.steps.build(step_params)
    if @step.save
      redirect_to guide_path(@guide), notice: 'Step was successfully created.'
    else
      redirect_to guide_path(@guide), alert: 'Step was not created.'
    end
  end

  def update
    if @step.update(step_params)
      redirect_to guide_path(@guide), notice: 'Step was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to :back, notice: 'Step was successfully destroyed.'
  end

  private

  def step_params
    params.require(:step).permit(:title, :establishment, :address, :city, :guide_id)
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def set_guide
    @guide = Guide.find(params[:guide_id])
  end
end
