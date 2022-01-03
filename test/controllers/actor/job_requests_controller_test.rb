require 'test_helper'

class Actor::JobRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actor_job_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get actor_job_requests_show_url
    assert_response :success
  end

end
