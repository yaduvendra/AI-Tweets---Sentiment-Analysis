class ApplicationController < ActionController::Base
  protect_from_forgery

  def make_error(obj)
    obj.errors.first.second
  end
end
