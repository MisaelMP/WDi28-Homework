class BooksController < ApplicationController

  def homepage

  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @book= Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def update
    book = Book.find params[:id]
    book.update book_params
    redirect_to book
  end

  def create
    book = Book.create book_params
    redirect_to book # get show page
  end
  def destroy
     book = Book.find params[:id]
     book.destroy
     redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :year, :genre, :cover, :writer_id)
  end
end