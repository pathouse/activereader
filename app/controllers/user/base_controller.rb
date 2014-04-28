class User::BaseController < ApplicationController
  before_action :preliminary_authorization

  private

  def preliminary_authorization
    unless current_user
      flash[:alert] = "You must be logged in to do that."
      redirect_to root_path
    end
  end

  def authorize_user
    authorize @user
  end
end