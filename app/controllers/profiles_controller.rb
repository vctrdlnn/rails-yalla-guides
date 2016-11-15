class ProfilesController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_profile, only: [:show, :edit]

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

  private

  def guide_params
    params.require(:profile).permit(:role, :user_id)
  end
  def set_user
    @user = User.find(current_user.id)
  end
  def set_profile
    @profile = @user.profiles.first
  end
end
