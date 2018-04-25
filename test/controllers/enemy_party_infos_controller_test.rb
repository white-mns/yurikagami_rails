require 'test_helper'

class EnemyPartyInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enemy_party_info = enemy_party_infos(:one)
  end

  test "should get index" do
    get enemy_party_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_enemy_party_info_url
    assert_response :success
  end

  test "should create enemy_party_info" do
    assert_difference('EnemyPartyInfo.count') do
      post enemy_party_infos_url, params: { enemy_party_info: { enemy_num: @enemy_party_info.enemy_num, generate_no: @enemy_party_info.generate_no, party_no: @enemy_party_info.party_no, result_no: @enemy_party_info.result_no } }
    end

    assert_redirected_to enemy_party_info_url(EnemyPartyInfo.last)
  end

  test "should show enemy_party_info" do
    get enemy_party_info_url(@enemy_party_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_enemy_party_info_url(@enemy_party_info)
    assert_response :success
  end

  test "should update enemy_party_info" do
    patch enemy_party_info_url(@enemy_party_info), params: { enemy_party_info: { enemy_num: @enemy_party_info.enemy_num, generate_no: @enemy_party_info.generate_no, party_no: @enemy_party_info.party_no, result_no: @enemy_party_info.result_no } }
    assert_redirected_to enemy_party_info_url(@enemy_party_info)
  end

  test "should destroy enemy_party_info" do
    assert_difference('EnemyPartyInfo.count', -1) do
      delete enemy_party_info_url(@enemy_party_info)
    end

    assert_redirected_to enemy_party_infos_url
  end
end
