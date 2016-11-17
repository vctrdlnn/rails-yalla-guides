class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :guide, :index]
  before_action :set_profile, only: [:show, :guide, :index]
  before_action :set_bookings, only: [:show, :guide]
  before_action :set_guide_bookings, only: [:guide]
  before_action :set_guides, only: [:show, :guide]

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(guide_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    @attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
  end

  def guide
  end

  private

  def guide_params
    params.require(:profile).permit(:role, :user_id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_profile
    @profile = @user.profile
  end

  def set_bookings
    @bookings = @profile.bookings
  end

  def set_guide_bookings
    @guide_bookings = []
    @profile.guides.each do |guide|
      guide.bookings.each { |booking| @guide_bookings << booking }
    end
    @guide_bookings
  end

  def set_guides
    @guides = @profile.guides
  end
end
