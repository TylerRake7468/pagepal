class AddVotesCountToRecommendations < ActiveRecord::Migration[7.1]
  def change
    add_column :recommendations, :votes_count, :integer, default: 0
  end
end
