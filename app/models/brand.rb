class Brand < ActiveRecord::Base

  has_many :tweets
  has_many :keywords
  accepts_nested_attributes_for :keywords, :allow_destroy => true, :reject_if => proc { |attr| attr['value'].blank? }

  validates :name, :presence => { :message => 'Every brand needs a name' }
  validates :twitter_handle, :presence => { :message => 'Why are you here without a twitter handle?' },
            :uniqueness => { :message => 'That twitter handle is already in use' }
  
  before_save :initiate_state

  STATE_PROCESSING = 'processing'
  STATE_ANALYZING = 'analyzing'

  def self.by_twitter(handle)
    where(:twitter_handle => handle).first
  end

  def add_tweets(new_tweets, max_id = 0)
    self.update_attributes(:last_max_id => max_id, :state => Brand::STATE_ANALYZING)

    new_tweets.each do |t|
      tweets << Tweet.new(
          :tweet_id => t['id_str'],
          :body => t['text'],
          :to_user_id => t['to_user_id'],
          :from_user_id => t['from_user_id'],
          :time => t['created_at']
        )
    end
  end

  private
  # default state is processing, make sure it is set
  def initiate_state
    if new_record?
      self.state = Brand::STATE_PROCESSING
    end
  end
end
