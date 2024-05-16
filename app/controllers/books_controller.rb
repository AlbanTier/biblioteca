class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @borrow_id = Borrow.find_by(book_id: @book.id, ended_at: nil)
    if logged_in?
      @can_end_borrow = check_if_user_borrow(@book.id, current_user.id)
    end
  end


  def check_if_user_borrow(book_id, user_id)
    Borrow.where(book_id: book_id, user_id: user_id, ended_at: nil).empty?
  end


end
