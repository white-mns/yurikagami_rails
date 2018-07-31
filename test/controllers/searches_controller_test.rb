require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search = searches(:one)
  end

  test "should get index" do
    get searches_url
    assert_response :success
  end

  test "should get new" do
    get new_search_url
    assert_response :success
  end

  test "should create search" do
    assert_difference('Search.count') do
      post searches_url, params: { search: { e_no: @search.e_no, generate_no: @search.generate_no, i_name: @search.i_name, i_no: @search.i_no, last_generate_no: @search.last_generate_no, last_result_no: @search.last_result_no, main_no: @search.main_no, result_no: @search.result_no, sub_no: @search.sub_no, value: @search.value } }
    end

    assert_redirected_to search_url(Search.last)
  end

  test "should show search" do
    get search_url(@search)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_url(@search)
    assert_response :success
  end

  test "should update search" do
    patch search_url(@search), params: { search: { e_no: @search.e_no, generate_no: @search.generate_no, i_name: @search.i_name, i_no: @search.i_no, last_generate_no: @search.last_generate_no, last_result_no: @search.last_result_no, main_no: @search.main_no, result_no: @search.result_no, sub_no: @search.sub_no, value: @search.value } }
    assert_redirected_to search_url(@search)
  end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete search_url(@search)
    end

    assert_redirected_to searches_url
  end
end
