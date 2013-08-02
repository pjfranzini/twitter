require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def login_as(user)
    session[:user_id] = user
  end

  test "confirm user exists" do
    login_as(users(:one))
    get :confirm, id: 1
    assert_response :success
  end

  test "create user sends conf email" do
    user = users(:one)
    ActionMailer::Base.deliveries.clear
    post :create, user: {name: user.name, email: user.email, handle: user.handle}

    invite_email = ActionMailer::Base.deliveries.last

    assert_equal user.email, invite_email.to[0]
    # assert_match(/Hi friend@example.com/, invite_email.body)
  end
end
