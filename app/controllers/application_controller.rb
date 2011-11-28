class ApplicationController < ActionController::Base
  protect_from_forgery

  def make_error(obj)
    obj.errors.first.second
  end

  def make_response(status, message, other = {})
    { :status => status, :message => message }.merge(other)
  end
end
