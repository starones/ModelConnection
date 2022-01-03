require 'test_helper'

class Actor::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actor_inquiries_index_url
    assert_response :success
  end

  test "should get confirm" do
    get actor_inquiries_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get actor_inquiries_thanks_url
    assert_response :success
  end

end
