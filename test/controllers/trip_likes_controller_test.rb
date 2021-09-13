require 'test_helper'

class TripLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trip_likes_index_url
    assert_response :success
  end

  test "should get create" do
    get trip_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get trip_likes_destroy_url
    assert_response :success
  end

end
