class BrandObserver < ActiveRecord::Observer
  def after_create(brand)
    # add the twitter handle to the message queue for future processing
    QueueMaster.fast_enqueue_fanout(QueueMaster::BRAND_EXCHANGE, brand.twitter_handle)
  end
end
