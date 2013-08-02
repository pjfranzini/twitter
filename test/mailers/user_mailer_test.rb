require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  tests UserMailer
  # http://guides.rubyonrails.org/testing.html#testing-your-mailers

  test "user confirmation email is sent to a new user's email" do
    # Send the email, then test that it got queued
    user = users(:one)
    email = UserMailer.confirm_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['info@thistwitter.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Confirm your email', email.subject
  end
end
