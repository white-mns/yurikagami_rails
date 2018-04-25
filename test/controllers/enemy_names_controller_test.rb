require 'test_helper'

class EnemyNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enemy_name = enemy_names(:one)
  end

  test "should get index" do
    get enemy_names_url
    assert_response :success
  end

  test "should get new" do
    get new_enemy_name_url
    assert_response :success
  end

  test "should create enemy_name" do
    assert_difference('EnemyName.count') do
      post enemy_names_url, params: { enemy_name: { enemy_id: @enemy_name.enemy_id, name: @enemy_name.name } }
    end

    assert_redirected_to enemy_name_url(EnemyName.last)
  end

  test "should show enemy_name" do
    get enemy_name_url(@enemy_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_enemy_name_url(@enemy_name)
    assert_response :success
  end

  test "should update enemy_name" do
    patch enemy_name_url(@enemy_name), params: { enemy_name: { enemy_id: @enemy_name.enemy_id, name: @enemy_name.name } }
    assert_redirected_to enemy_name_url(@enemy_name)
  end

  test "should destroy enemy_name" do
    assert_difference('EnemyName.count', -1) do
      delete enemy_name_url(@enemy_name)
    end

    assert_redirected_to enemy_names_url
  end
end
