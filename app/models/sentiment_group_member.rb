class SentimentGroupMember < ActiveRecord::Base
  belongs_to :sentiment_group
  belongs_to :brand
end
