require 'test_helper'

class ItemGetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_get = item_gets(:one)
  end

  test "should get index" do
    get item_gets_url
    assert_response :success
  end

  test "should get new" do
    get new_item_get_url
    assert_response :success
  end

  test "should create item_get" do
    assert_difference('ItemGet.count') do
      post item_gets_url, params: { item_get: { e_no: @item_get.e_no, enemy: @item_get.enemy, generate_no: @item_get.generate_no, is_pk: @item_get.is_pk, item: @item_get.item, party_no: @item_get.party_no, result_no: @item_get.result_no, sub_no: @item_get.sub_no } }
    end

    assert_redirected_to item_get_url(ItemGet.last)
  end

  test "should show item_get" do
    get item_get_url(@item_get)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_get_url(@item_get)
    assert_response :success
  end

  test "should update item_get" do
    patch item_get_url(@item_get), params: { item_get: { e_no: @item_get.e_no, enemy: @item_get.enemy, generate_no: @item_get.generate_no, is_pk: @item_get.is_pk, item: @item_get.item, party_no: @item_get.party_no, result_no: @item_get.result_no, sub_no: @item_get.sub_no } }
    assert_redirected_to item_get_url(@item_get)
  end

  test "should destroy item_get" do
    assert_difference('ItemGet.count', -1) do
      delete item_get_url(@item_get)
    end

    assert_redirected_to item_gets_url
  end
end
