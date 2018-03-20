require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { ability: @item.ability, charge: @item.charge, e_no: @item.e_no, effect: @item.effect, effect_num: @item.effect_num, equip: @item.equip, generate_no: @item.generate_no, guard: @item.guard, have_max: @item.have_max, have_rest: @item.have_rest, item_no: @item.item_no, kind: @item.kind, magic: @item.magic, name: @item.name, prize: @item.prize, protect: @item.protect, result_no: @item.result_no, slash: @item.slash, sub_no: @item.sub_no } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { ability: @item.ability, charge: @item.charge, e_no: @item.e_no, effect: @item.effect, effect_num: @item.effect_num, equip: @item.equip, generate_no: @item.generate_no, guard: @item.guard, have_max: @item.have_max, have_rest: @item.have_rest, item_no: @item.item_no, kind: @item.kind, magic: @item.magic, name: @item.name, prize: @item.prize, protect: @item.protect, result_no: @item.result_no, slash: @item.slash, sub_no: @item.sub_no } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
