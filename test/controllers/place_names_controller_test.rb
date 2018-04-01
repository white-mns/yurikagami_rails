require 'test_helper'

class PlaceNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_name = place_names(:one)
  end

  test "should get index" do
    get place_names_url
    assert_response :success
  end

  test "should get new" do
    get new_place_name_url
    assert_response :success
  end

  test "should create place_name" do
    assert_difference('PlaceName.count') do
      post place_names_url, params: { place_name: { name: @place_name.name, place_id: @place_name.place_id } }
    end

    assert_redirected_to place_name_url(PlaceName.last)
  end

  test "should show place_name" do
    get place_name_url(@place_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_name_url(@place_name)
    assert_response :success
  end

  test "should update place_name" do
    patch place_name_url(@place_name), params: { place_name: { name: @place_name.name, place_id: @place_name.place_id } }
    assert_redirected_to place_name_url(@place_name)
  end

  test "should destroy place_name" do
    assert_difference('PlaceName.count', -1) do
      delete place_name_url(@place_name)
    end

    assert_redirected_to place_names_url
  end
end
