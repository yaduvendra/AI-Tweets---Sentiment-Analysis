class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.integer :brand_id
      t.integer :timestamp
      t.integer :num_tweets
      t.decimal :total_score
      t.integer :num_positive
      t.integer :num_negative

      t.timestamps
    end
  end
end
