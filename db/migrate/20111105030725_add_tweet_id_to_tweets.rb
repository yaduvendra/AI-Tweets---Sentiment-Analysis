class AddTweetIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_id, :integer, :null => false
  end
end
