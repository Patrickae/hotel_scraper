require "test_helper"

class SimpleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simple_item = simple_items(:one)
  end

  test "should get index" do
    get simple_items_url, as: :json
    assert_response :success
  end

  test "should create simple_item" do
    assert_difference("SimpleItem.count") do
      post simple_items_url, params: { simple_item: { value: @simple_item.value } }, as: :json
    end

    assert_response :created
  end

  test "should show simple_item" do
    get simple_item_url(@simple_item), as: :json
    assert_response :success
  end

  test "should update simple_item" do
    patch simple_item_url(@simple_item), params: { simple_item: { value: @simple_item.value } }, as: :json
    assert_response :success
  end

  test "should destroy simple_item" do
    assert_difference("SimpleItem.count", -1) do
      delete simple_item_url(@simple_item), as: :json
    end

    assert_response :no_content
  end
end
