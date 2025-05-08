class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @recommendation = current_user.recommendations.includes(:book, :votes)
  end
end
