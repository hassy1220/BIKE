require "test_helper"

class PostBikeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_bike_comments_create_url
    assert_response :success
  end
end
