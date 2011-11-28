class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.integer :brand_id, :null => false
      t.integer :timestamp, :null => false
      t.integer :num_tweets, :null => false
      t.decimal :total_score, :null => false, :default => 0
      t.integer :num_positive, :null => false, :default => 0
      t.integer :num_negative, :null => false, :default => 0

      t.timestamps
    end
  end
end
