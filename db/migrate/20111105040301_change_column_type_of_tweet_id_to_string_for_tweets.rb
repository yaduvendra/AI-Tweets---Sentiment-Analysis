class ChangeColumnTypeOfTweetIdToStringForTweets < ActiveRecord::Migration
  def up
    change_column :tweets, :tweet_id, :string, :null => false, :unique => true
  end

  def down
  end
end
