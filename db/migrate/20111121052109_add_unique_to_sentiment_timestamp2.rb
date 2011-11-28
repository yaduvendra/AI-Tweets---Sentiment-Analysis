class AddUniqueToSentimentTimestamp2 < ActiveRecord::Migration
  def change
    add_index :sentiments, [:brand_id, :timestamp], :unique => true
  end
end
