class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:sort] == "top"
      @books = Book.joins(:recommendations).group("books.id").order("SUM(recommendations.votes_count) DESC")
    else
      @books = Book.includes(:user).order(created_at: :desc)
    end
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

  def trending
    @books = Book
            .with_attached_image
            .left_joins(:recommendations)
            .select("books.*, COALESCE(SUM(recommendations.votes_count), 0) AS total_votes")
            .group("books.id")
            .order("total_votes DESC")
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :image)
  end
end
