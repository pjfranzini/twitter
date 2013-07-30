class TweetsController < ApplicationController

  before_action :check_user_login, only: [:new, :create]

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = @current_user.tweets.build(tweets_params)
    if @tweet.save
      redirect_to tweets_url
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def tweets_params
    params.require(:tweet).permit(:content)
  end
end
