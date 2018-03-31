require 'test_helper'

class PartyInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party_info = party_infos(:one)
  end

  test "should get index" do
    get party_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_party_info_url
    assert_response :success
  end

  test "should create party_info" do
    assert_difference('PartyInfo.count') do
      post party_infos_url, params: { party_info: { battler_num: @party_info.battler_num, generate_no: @party_info.generate_no, member_num: @party_info.member_num, name: @party_info.name, party_no: @party_info.party_no, result_no: @party_info.result_no, sook_num: @party_info.sook_num } }
    end

    assert_redirected_to party_info_url(PartyInfo.last)
  end

  test "should show party_info" do
    get party_info_url(@party_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_party_info_url(@party_info)
    assert_response :success
  end

  test "should update party_info" do
    patch party_info_url(@party_info), params: { party_info: { battler_num: @party_info.battler_num, generate_no: @party_info.generate_no, member_num: @party_info.member_num, name: @party_info.name, party_no: @party_info.party_no, result_no: @party_info.result_no, sook_num: @party_info.sook_num } }
    assert_redirected_to party_info_url(@party_info)
  end

  test "should destroy party_info" do
    assert_difference('PartyInfo.count', -1) do
      delete party_info_url(@party_info)
    end

    assert_redirected_to party_infos_url
  end
end
