class KindleRawClippingsController < ApplicationController
  before_action :load_user
  before_action :load_kindle_raw_clipping, only: [:show, :destroy]
  before_action :authorize_kindle_raw_clipping

  def new
    @kindle_raw_clipping = KindleRawClipping.new
  end

  def create
    @kindle_raw_clipping = KindleRawClipping.new(permitted_params)
    if @kindle_raw_clipping.save
      @user.kindle_raw_clippings << @kindle_raw_clipping
      flash[:notice] = "New raw clipping file successfully uploaded!"
      redirect_to kindle_raw_clippings_path(@user)
    else
      flash[:error] = "Something went wrong with your upload."
      render :new
    end
  end

  def show
  end

  def index
    @kindle_raw_clippings = @user.kindle_raw_clippings
  end

  def destroy
    @kindle_raw_clipping.destroy
    flash[:notice] = "Raw clipping file successfully destroyed."
    redirect_to kindle_raw_clippings_path(@user)
  end

  private

  def permitted_params
    params.require(:kindle_raw_clipping).permit(:clipping_file)
  end

  def load_kindle_raw_clipping
    @kindle_raw_clipping = KindleRawClipping.find(params[:id])
  end

  def authorize_kindle_raw_clipping
    if @kindle_raw_clipping
      authorize @kindle_raw_clipping
    else
      authorize KindleRawClipping.new
    end
  end
end