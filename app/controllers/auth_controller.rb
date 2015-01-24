class AuthController < ApplicationController
  before_action :preliminary_authorization

  private

  def preliminary_authorization
    unless current_user
      flash[:alert] = "You must be logged in to do that."
      redirect_to root_path
    end
  end
end
