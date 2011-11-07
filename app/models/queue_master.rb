require 'bunny'
require 'amqp'

class QueueMaster

  BRAND_EXCHANGE = 'brand_exchange'
  ANALYSIS_EXCHANGE = 'analysis_exchange'

  def self.host
    'localhost'
  end

  # bunny is good at fast synchronous queueing
  def self.fast_enqueue_fanout(exchange_name, message)
    Bunny.run { |c| c.exchange(exchange_name, :type => :fanout, :durable => true).publish(message, :persistent => true) }
  end
end
