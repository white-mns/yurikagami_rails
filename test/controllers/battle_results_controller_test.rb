require 'test_helper'

class BattleResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @battle_result = battle_results(:one)
  end

  test "should get index" do
    get battle_results_url
    assert_response :success
  end

  test "should get new" do
    get new_battle_result_url
    assert_response :success
  end

  test "should create battle_result" do
    assert_difference('BattleResult.count') do
      post battle_results_url, params: { battle_result: { battle_result: @battle_result.battle_result, generate_no: @battle_result.generate_no, party_no: @battle_result.party_no, result_no: @battle_result.result_no } }
    end

    assert_redirected_to battle_result_url(BattleResult.last)
  end

  test "should show battle_result" do
    get battle_result_url(@battle_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_battle_result_url(@battle_result)
    assert_response :success
  end

  test "should update battle_result" do
    patch battle_result_url(@battle_result), params: { battle_result: { battle_result: @battle_result.battle_result, generate_no: @battle_result.generate_no, party_no: @battle_result.party_no, result_no: @battle_result.result_no } }
    assert_redirected_to battle_result_url(@battle_result)
  end

  test "should destroy battle_result" do
    assert_difference('BattleResult.count', -1) do
      delete battle_result_url(@battle_result)
    end

    assert_redirected_to battle_results_url
  end
end
