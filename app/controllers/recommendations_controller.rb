class RecommendationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recommendations = Recommendation.includes(:user, :book).order(created_at: :desc)
  end

  def new
    @book = Book.find(params[:book_id])

    if current_user.recommendations.exists?(book: @book)
      redirect_to @book, alert: "You have already recommended this book."
    else
      @recommendation = Recommendation.new
    end
  end

  def create
    @book = Book.find(params[:book_id])
    @recommendation = @book.recommendations.build(recommendation_params.merge(user: current_user))

    if @recommendation.save
      redirect_to book_path(@book), notice: "Recommendation posted!"
    else
      redirect_to book_path(@book), alert: @recommendation.errors.full_messages.to_sentence
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:review)
  end
end

