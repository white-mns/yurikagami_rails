require 'test_helper'

class ProperNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proper_name = proper_names(:one)
  end

  test "should get index" do
    get proper_names_url
    assert_response :success
  end

  test "should get new" do
    get new_proper_name_url
    assert_response :success
  end

  test "should create proper_name" do
    assert_difference('ProperName.count') do
      post proper_names_url, params: { proper_name: { name: @proper_name.name, proper_id: @proper_name.proper_id } }
    end

    assert_redirected_to proper_name_url(ProperName.last)
  end

  test "should show proper_name" do
    get proper_name_url(@proper_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_proper_name_url(@proper_name)
    assert_response :success
  end

  test "should update proper_name" do
    patch proper_name_url(@proper_name), params: { proper_name: { name: @proper_name.name, proper_id: @proper_name.proper_id } }
    assert_redirected_to proper_name_url(@proper_name)
  end

  test "should destroy proper_name" do
    assert_difference('ProperName.count', -1) do
      delete proper_name_url(@proper_name)
    end

    assert_redirected_to proper_names_url
  end
end
