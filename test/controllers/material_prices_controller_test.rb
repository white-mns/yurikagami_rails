require 'test_helper'

class MaterialPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_price = material_prices(:one)
  end

  test "should get index" do
    get material_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_material_price_url
    assert_response :success
  end

  test "should create material_price" do
    assert_difference('MaterialPrice.count') do
      post material_prices_url, params: { material_price: { is_sub: @material_price.is_sub, name: @material_price.name, performance: @material_price.performance, price: @material_price.price } }
    end

    assert_redirected_to material_price_url(MaterialPrice.last)
  end

  test "should show material_price" do
    get material_price_url(@material_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_price_url(@material_price)
    assert_response :success
  end

  test "should update material_price" do
    patch material_price_url(@material_price), params: { material_price: { is_sub: @material_price.is_sub, name: @material_price.name, performance: @material_price.performance, price: @material_price.price } }
    assert_redirected_to material_price_url(@material_price)
  end

  test "should destroy material_price" do
    assert_difference('MaterialPrice.count', -1) do
      delete material_price_url(@material_price)
    end

    assert_redirected_to material_prices_url
  end
end
