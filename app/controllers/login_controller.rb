class LoginController < ApplicationController
  def login
    @user = User.new
  end

  def create_session
    @user = User.find_by(email: params[:user][:email])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def logout
    session[:user_id] = nil #or reset_session to remove all
    redirect_to tweets_path
  end
end
