class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recommendation, only: [:create, :destroy]

  def create
    current_user.votes.create(recommendation: @recommendation)

    redirect_back fallback_location: books_path, notice: "Voted"
  end

  def destroy
    current_user.votes.find_by(recommendation: @recommendation)&.destroy

    redirect_back fallback_location: books_path, notice: "Vote removed"
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find_by(id: params[:recommendation_id])
  end
end
