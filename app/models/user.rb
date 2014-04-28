class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :username

  def auth_token
    set_auth_token unless super
    super
  end

  private

  def set_auth_token
    self.update_attribute(:auth_token, BCrypt::Password.create(Time.now.to_s + id.to_s))
    save!
  end
end
