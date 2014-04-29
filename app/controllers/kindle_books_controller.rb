class KindleBooksController < ApplicationController
  before_action :load_user

  def index
    @kindle_books = @user.kindle_books.includes(:kindle_notes)
  end

  def show
    @kindle_book = @user.kindle_books.includes(:kindle_notes).find(params[:id])
  end
end