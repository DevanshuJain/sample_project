require 'test_helper'

class ReadersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get readers_index_url
    assert_response :success
  end

end
