# wraps calls to the twitter apis
class Twitter < API

  def self.root
    'http://search.twitter.com'
  end

  def self.credentials
    {}
  end

  # makes a call to the twitter search api given a query search
  # returns a json parsed response
  def self.search(query, search_options)
    get '/search.json', search_options.merge({ :q => query, :include_entities => true })
  end
end
