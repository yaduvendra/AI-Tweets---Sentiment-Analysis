class Tweet < ActiveRecord::Base

  belongs_to :brand

  validates :body, :presence => { :message => 'Tweets need a body' }
  validates :tweet_id, :uniqueness => { :message => 'We already have that tweet. thanks!' }
end
