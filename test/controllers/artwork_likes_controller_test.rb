require 'test_helper'

class ArtworkLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artwork_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get artwork_likes_destroy_url
    assert_response :success
  end

end
