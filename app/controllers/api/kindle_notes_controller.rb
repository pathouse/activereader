class Api::KindleNotesController < ApplicationController
  before_filter :load_kindle_book

  def index

  end

  private

  def load_and_authorize_kindle_book
    @book = KindleBook.find(params[:kindle_book_id])
  end
end
