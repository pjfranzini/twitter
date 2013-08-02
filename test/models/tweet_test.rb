require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "tweet can get user's name" do
    tweet = tweets(:one)
    assert_equal tweet.user.name, "MyString"
  end

    test "tweet can get user's id" do
    tweet = tweets(:one)
    assert_equal tweet.user.id, users(:one).id
  end

  test "tweet can't be blank" do
    tweet = Tweet.new(content: "")
    tweet.save
    assert !tweet.valid?
  end

  test "tweet can't be longer than 140 characters" do
    tweet = Tweet.new(content: "sadf
      asdfsdkjf asd asdfdf asdfsdf asdfs
      sdfsdfasdf asdf asdfsdf asdfsad asdf asdfasdf asdf asdfasd asdfsadf asdfas sdfasd fasdfdsf asdfasdf asdfa asdf asdf asdfasd adsfa sd fadsf asdfasdf adsf asdfadf aasdf as")
    tweet.save
    assert !tweet.valid?
  end
end
