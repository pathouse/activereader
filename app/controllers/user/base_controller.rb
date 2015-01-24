class User::BaseController < ::AuthController

  def authorize_user
    authorize @user
  end

  def load_user
    @user = User.find(params[:id])
  end
end
