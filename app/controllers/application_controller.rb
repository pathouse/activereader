class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to do that."
    redirect_to (current_user ? user_dashboard_path(current_user) : root_path)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
