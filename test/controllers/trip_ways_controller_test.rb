require 'test_helper'

class TripWaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trip_ways_index_url
    assert_response :success
  end

  test "should get new" do
    get trip_ways_new_url
    assert_response :success
  end

  test "should get create" do
    get trip_ways_create_url
    assert_response :success
  end

  test "should get show" do
    get trip_ways_show_url
    assert_response :success
  end

  test "should get edit" do
    get trip_ways_edit_url
    assert_response :success
  end

  test "should get update" do
    get trip_ways_update_url
    assert_response :success
  end

end
