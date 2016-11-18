class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @guide = Guide.new
  end
  def nothing

  end
end
