require 'test_helper'

class Actor::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actor_clients_index_url
    assert_response :success
  end

  test "should get show" do
    get actor_clients_show_url
    assert_response :success
  end

end
