require 'test_helper'

class Actor::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get actor_searchs_search_url
    assert_response :success
  end

end
