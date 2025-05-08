class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.includes(:user).order(created_at: :desc)
  end

  def show
    @book = Book.includes(recommendations: :user).find(params[:id])
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: "Book recommended successfully!"
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :image)
  end
end
