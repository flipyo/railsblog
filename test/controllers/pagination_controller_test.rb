require 'test_helper'

class PaginationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pagination_index_url
    assert_response :success
  end

  test "should get pagination" do
    get pagination_pagination_url
    assert_response :success
  end

  test "should get get_articles" do
    get pagination_get_articles_url
    assert_response :success
  end

end
