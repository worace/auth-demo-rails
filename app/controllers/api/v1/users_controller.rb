class Api::V1::UsersController < Api::V1::BaseController
  before_filter :require_login, :except => [:create]
  def show
  end

  def create
    if user = User.create(user_params)
      render :json => {:username => user.username, :auth_token => user.auth_token}
    else
      render :json => {}
    end
  end

  def me
    render :json => current_user.to_json
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
