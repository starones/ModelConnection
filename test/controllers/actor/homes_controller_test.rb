require 'test_helper'

class Actor::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get actor_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get actor_homes_about_url
    assert_response :success
  end

end
