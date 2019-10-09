require 'test_helper'

class PostDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_details_new_url
    assert_response :success
  end

end
