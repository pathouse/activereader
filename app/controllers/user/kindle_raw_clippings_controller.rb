class User::KindleRawClippingsController < User::BaseController
  before_action :load_kindle_raw_clipping, only: [:show, :destroy]
  before_action :authorize_kindle_raw_clipping, only: [:show, :destroy]

  def new
    @kindle_raw_clipping = KindleRawClipping.new
  end

  def create
    @kindle_raw_clipping = KindleRawClipping.new(permitted_params)
    if @kindle_raw_clipping.save
      flash[:notice] = "New raw clipping file successfully uploaded!"
      redirect_to user_kindle_raw_clippings_path(@user)
    else
      flash[:error] = "Something went wrong with your upload."
      render :new
    end
  end

  def show
  end

  def index
    @user.kindle_raw_clippings
  end

  def destroy
    @kindle_raw_clipping.destroy
    flash[:notice] = "Raw clipping file successfully destroyed."
    redirect_to user_kindle_raw_clippings_path(@user)
  end

  private

  def permitted_params
    params.require(:kindle_raw_clipping).permit(:clipping_file_file_name,
                                                :clipping_file_content_type,
                                                :clipping_file_file_size,
                                                :clipping_file_updated_at,
                                                :user_id)
  end

  def load_kindle_raw_clipping
    @kindle_raw_clipping = KindleRawClipping.find(params[:id])
  end

  def authorize_kindle_raw_clipping
    authorize @kindle_raw_clipping
  end

end