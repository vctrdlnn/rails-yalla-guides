class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :set_guide, only: [:new, :create, :edit, :update ]

  def index
    @steps = Step.all
  end

  def show
  end

  def new
    @step = Step.new(step_params)
  end

  def edit

  end

  def create
    @step = @guide.steps.build(step_params)
    if @step.save
      redirect_to guide_step_path(@guide, @step), notice: 'Step was successfully created.'
    else
      render :edit
    end
  end

  def update
  end

  def destroy
  end

  private

  def step_params
    params.require(:step).permit(:title, :establishment, :address, :city)
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def set_guide
    @guide = Guide.find(params[:guide_id])
  end
end
