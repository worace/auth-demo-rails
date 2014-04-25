class Api::V1::UsersController < Api::V1::BaseController
  before_filter :require_login
  def show
  end

  def me
    render :json => current_user.to_json
  end
end
