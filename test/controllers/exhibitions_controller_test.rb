require 'test_helper'

class ExhibitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get exhibitions_show_url
    assert_response :success
  end

end
