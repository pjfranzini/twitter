class UsersController < ApplicationController
  before_action :check_user_login, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def edit
    # @current_user => this is available from the check_user_login method
  end

  def update
    @current_user.update(user_params)
    redirect_to @current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image_url, :handle, :avatar, :remove_avatar, :avatar_two, :remove_avatar_two)
  end

end
