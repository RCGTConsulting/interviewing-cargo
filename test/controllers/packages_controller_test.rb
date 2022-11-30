require "test_helper"

class PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get packages_show_url
    assert_response :success
  end
end
