class Api::V1::AuthTokensController < Api::V1::BaseController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      user.auth_token = BCrypt::Password.create(Time.now.to_s + user.email) if user.auth_token.blank?
      user.save!
      render :json => {:email => user.email, :username => user.username, :auth_token => user.auth_token}
    else
      render :json => {:error => "invalid credentials"}, :status => 401
    end
  end
end
