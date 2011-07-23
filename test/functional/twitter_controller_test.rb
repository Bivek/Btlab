require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get recent_tweets" do
    get :recent_tweets
    assert_response :success
  end

end
