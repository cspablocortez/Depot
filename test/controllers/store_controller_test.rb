require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    # I want at least four links in my nav
    assert_select 'nav a', minimum: 4
    assert_select 'main ul li', minimum: 3
    assert_select 'h2', 'Programming Ruby 1.9' # end of may 18 class
  end
end
