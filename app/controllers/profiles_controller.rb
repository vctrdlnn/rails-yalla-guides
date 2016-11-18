class ProfilesController < ApplicationController
  before_action :set_user, only: [:user_dashboard, :guide_dashboard, :index, :update, :show]
  before_action :set_profile, only: [:user_dashboard, :guide_dashboard, :index, :update, :show]
  before_action :set_bookings, only: [:user_dashboard, :guide_dashboard]
  before_action :set_guide_bookings, only: [:guide_dashboard]
  before_action :set_guides, only: [:user_dashboard, :guide_dashboard]

  def show
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

  def guide_dashboard
  end

  def update
    if @profile.update(guide_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def user_dashboard
    @profile = Profile.find(params[:id])
  end

  private

  def guide_params
    params.require(:profile).permit(:role, :user_id, :photo, :photo_cache, :hometown, :birthday, :aboutme)
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
