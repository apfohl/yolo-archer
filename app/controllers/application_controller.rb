class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      user = User.find_by_username name
      user && user.authenticate(password)
    end
  end

  helper_method :authenticate
end
