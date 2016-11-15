class ProfilesController < ApplicationController
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
    @profile = Profile.find_by user_id: current_user.id
    @attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
  end

  private

  def guide_params
    params.require(:profile).permit(:role, :user_id)
  end
end
