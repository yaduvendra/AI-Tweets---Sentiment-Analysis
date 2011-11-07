require 'rest_client'
require 'json'

# Wraps basic get and post requests to rest servers
# Assumes response is in JSON
class API
  def self.get(path, options = {})
    params = options.merge(credentials).to_query
    begin
      response = RestClient.get("#{root}#{path}?#{params}")
      JSON.parse(response)
    rescue => e
      false
    end
  end

  def self.post(path, options = {})
    begin
      response = RestClient.post("#{root}#{path}", options.merge(credentials))
      JSON.parse(response)
    rescue => e
      false
    end
  end
end
