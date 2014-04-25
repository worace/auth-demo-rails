class Api::V1::BaseController < ApplicationController
   skip_before_action :verify_authenticity_token
  AUTH_TOKEN_HEADER = "AuthToken"

  def current_user
    @current_user ||= User.find_by_auth_token(auth_token) if auth_token
  end

  def auth_token
    request.headers[AUTH_TOKEN_HEADER] || params[AUTH_TOKEN_HEADER]
  end

  def require_login
    head :unauthorized unless current_user
  end
end
