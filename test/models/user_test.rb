require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(:username => "worace",
                        :email => "worace@wo.race",
                        :password => "hungry",
                        :password_confirmation => "hungry")
  end
  test "#auth_token generates token if one does not exist" do
    assert_nil @user.attributes["auth_token"]
    assert_not_nil @user.auth_token
    @user.reload
    assert_not_nil @user.attributes["auth_token"]
  end

  test "#auth_token doesnt mess with already generated token" do
    @user.update_attribute(:auth_token, "pizza")
    assert_equal "pizza", @user.auth_token
  end
end
