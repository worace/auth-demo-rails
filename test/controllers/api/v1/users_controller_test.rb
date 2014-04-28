require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  test "POST create with valid params creates a user record" do
    post :create, :username => "worace", :password => "hungry", :password_confirmation => "hungry"
    assert_response :success
    assert_equal "worace", User.last.username
  end

  test "POST create returns JSON with user info and auth token" do
    post :create, :username => "worace", :password => "hungry", :password_confirmation => "hungry"
    response = JSON.parse(@response.body)
    assert_equal ["username", "auth_token"], response.keys
    assert (response["auth_token"].length > 0)
  end

end
