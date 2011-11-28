class AddNormalizedTotalScoreToSentiments < ActiveRecord::Migration
  def change
    add_column :sentiments, :normalized_total_score, :decimal, :null => false, :default => 0
  end
end
