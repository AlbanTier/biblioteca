class BorrowsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    if check_availability(params[:book_id])
      @borrow = Borrow.new(book_id: params[:book_id], user_id: session[:user_id], started_at: Time.now)
      if @borrow.save
        redirect_to @book, notice: "Commande prise en compte."
      else
        render 'books/show', alert: "Impossible de prendre en compte la commande."
        puts @borrow.errors.inspect
      end
    else
      redirect_to @book, alert: "Le livre est déjà emprunter"
    end
  end
  def destroy
    @borrow = Borrow.find(params[:id])
    @borrow.update(ended_at: Time.now)
    redirect_to @borrow.book, notice: "Le livre a été rendu avec succès."
  end

  private

    def check_availability(book_id)
      Borrow.where(book_id: book_id, ended_at: nil).empty?
    end



  end

