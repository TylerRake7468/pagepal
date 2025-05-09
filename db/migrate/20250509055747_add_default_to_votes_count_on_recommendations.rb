class AddDefaultToVotesCountOnRecommendations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :recommendations, :votes_count, from: nil, to: 0
  end
end
