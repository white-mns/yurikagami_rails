require 'test_helper'

class SmithDisplaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smith_display = smith_displays(:one)
  end

  test "should get index" do
    get smith_displays_url
    assert_response :success
  end

  test "should get new" do
    get new_smith_display_url
    assert_response :success
  end

  test "should create smith_display" do
    assert_difference('SmithDisplay.count') do
      post smith_displays_url, params: { smith_display: { display_rate: @smith_display.display_rate, e_no: @smith_display.e_no, generate_no: @smith_display.generate_no, party_no: @smith_display.party_no, price_rate: @smith_display.price_rate, result_no: @smith_display.result_no, sub_no: @smith_display.sub_no, total_price: @smith_display.total_price } }
    end

    assert_redirected_to smith_display_url(SmithDisplay.last)
  end

  test "should show smith_display" do
    get smith_display_url(@smith_display)
    assert_response :success
  end

  test "should get edit" do
    get edit_smith_display_url(@smith_display)
    assert_response :success
  end

  test "should update smith_display" do
    patch smith_display_url(@smith_display), params: { smith_display: { display_rate: @smith_display.display_rate, e_no: @smith_display.e_no, generate_no: @smith_display.generate_no, party_no: @smith_display.party_no, price_rate: @smith_display.price_rate, result_no: @smith_display.result_no, sub_no: @smith_display.sub_no, total_price: @smith_display.total_price } }
    assert_redirected_to smith_display_url(@smith_display)
  end

  test "should destroy smith_display" do
    assert_difference('SmithDisplay.count', -1) do
      delete smith_display_url(@smith_display)
    end

    assert_redirected_to smith_displays_url
  end
end
