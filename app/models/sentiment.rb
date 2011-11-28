class Sentiment < ActiveRecord::Base
  belongs_to :brand

  validates :timestamp, :presence => true
#  validates_uniqueness_of :timestamp, :scaope => :brand_id
  validates :num_tweets, :presence => true
  validates :total_score, :presence => true
  validates :num_positive, :presence => true
  validates :num_negative, :presence => true
end
