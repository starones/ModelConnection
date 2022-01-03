require 'test_helper'

class Client::JobRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_job_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get client_job_requests_show_url
    assert_response :success
  end

  test "should get edit" do
    get client_job_requests_edit_url
    assert_response :success
  end

  test "should get new" do
    get client_job_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get client_job_requests_create_url
    assert_response :success
  end

  test "should get update" do
    get client_job_requests_update_url
    assert_response :success
  end

  test "should get destroy" do
    get client_job_requests_destroy_url
    assert_response :success
  end

end
