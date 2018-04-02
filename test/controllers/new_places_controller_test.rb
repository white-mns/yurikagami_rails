require 'test_helper'

class NewPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_place = new_places(:one)
  end

  test "should get index" do
    get new_places_url
    assert_response :success
  end

  test "should get new" do
    get new_new_place_url
    assert_response :success
  end

  test "should create new_place" do
    assert_difference('NewPlace.count') do
      post new_places_url, params: { new_place: { generate_no: @new_place.generate_no, place: @new_place.place, result_no: @new_place.result_no } }
    end

    assert_redirected_to new_place_url(NewPlace.last)
  end

  test "should show new_place" do
    get new_place_url(@new_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_place_url(@new_place)
    assert_response :success
  end

  test "should update new_place" do
    patch new_place_url(@new_place), params: { new_place: { generate_no: @new_place.generate_no, place: @new_place.place, result_no: @new_place.result_no } }
    assert_redirected_to new_place_url(@new_place)
  end

  test "should destroy new_place" do
    assert_difference('NewPlace.count', -1) do
      delete new_place_url(@new_place)
    end

    assert_redirected_to new_places_url
  end
end
