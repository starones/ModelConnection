require 'test_helper'

class Client::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get client_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get client_favorites_destroy_url
    assert_response :success
  end

end
