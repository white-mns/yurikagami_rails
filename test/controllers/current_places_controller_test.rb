require 'test_helper'

class CurrentPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_place = current_places(:one)
  end

  test "should get index" do
    get current_places_url
    assert_response :success
  end

  test "should get new" do
    get new_current_place_url
    assert_response :success
  end

  test "should create current_place" do
    assert_difference('CurrentPlace.count') do
      post current_places_url, params: { current_place: { generate_no: @current_place.generate_no, inn: @current_place.inn, party_no: @current_place.party_no, place: @current_place.place, result_no: @current_place.result_no, shop: @current_place.shop } }
    end

    assert_redirected_to current_place_url(CurrentPlace.last)
  end

  test "should show current_place" do
    get current_place_url(@current_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_current_place_url(@current_place)
    assert_response :success
  end

  test "should update current_place" do
    patch current_place_url(@current_place), params: { current_place: { generate_no: @current_place.generate_no, inn: @current_place.inn, party_no: @current_place.party_no, place: @current_place.place, result_no: @current_place.result_no, shop: @current_place.shop } }
    assert_redirected_to current_place_url(@current_place)
  end

  test "should destroy current_place" do
    assert_difference('CurrentPlace.count', -1) do
      delete current_place_url(@current_place)
    end

    assert_redirected_to current_places_url
  end
end
