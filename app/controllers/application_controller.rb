class ApplicationController < ActionController::Base
  protect_from_forgery

  def permission_denied
    render file: 'public/401', format: :html, status: :unauthorized
  end
end
