require 'test_helper'

class ArtworkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artwork_index_url
    assert_response :success
  end

end
