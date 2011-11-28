class SentimentGroup < ActiveRecord::Base
  has_many :sentiment_group_members
  has_many :brands, :through => :sentiment_group_members
  accepts_nested_attributes_for :brands, :allow_destroy => true
end
