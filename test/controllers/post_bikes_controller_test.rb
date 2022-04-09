require "test_helper"

class PostBikesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_bikes_new_url
    assert_response :success
  end

  test "should get show" do
    get post_bikes_show_url
    assert_response :success
  end

  test "should get index" do
    get post_bikes_index_url
    assert_response :success
  end
end
