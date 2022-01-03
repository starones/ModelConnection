require 'test_helper'

class Actor::ActorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actor_actors_index_url
    assert_response :success
  end

  test "should get show" do
    get actor_actors_show_url
    assert_response :success
  end

  test "should get edit" do
    get actor_actors_edit_url
    assert_response :success
  end

  test "should get update" do
    get actor_actors_update_url
    assert_response :success
  end

end
