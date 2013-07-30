require 'test_helper'

class TweetsControllerTest < ActionController::TestCase

  def login_as(user)
    session[:user_id] = user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: tweets(:one).id
    assert_response :success
  end

  test "get new should redirect when not logged in" do
    get :new
    assert_redirected_to login_path
  end

  test "post create should redirect when not logged in" do
    post :create, tweet: {content: "Hello"}
    assert_redirected_to login_path
  end

  test "should get new when logged in" do
    login_as(users(:one))
    get :new
    assert_response :success
  end

  test "should post to create when logged in" do
    login_as(users(:one))
    post :create, tweet: {content: "Hello"}
    assert_redirected_to tweets_path
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   put :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   delete :destroy
  #   assert_response :success
  # end

end
