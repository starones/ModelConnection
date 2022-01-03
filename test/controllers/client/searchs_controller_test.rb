require 'test_helper'

class Client::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get client_searchs_search_url
    assert_response :success
  end

end
