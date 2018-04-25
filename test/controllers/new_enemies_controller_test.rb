require 'test_helper'

class NewEnemiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_enemy = new_enemies(:one)
  end

  test "should get index" do
    get new_enemies_url
    assert_response :success
  end

  test "should get new" do
    get new_new_enemy_url
    assert_response :success
  end

  test "should create new_enemy" do
    assert_difference('NewEnemy.count') do
      post new_enemies_url, params: { new_enemy: { enemy: @new_enemy.enemy, generate_no: @new_enemy.generate_no, result_no: @new_enemy.result_no } }
    end

    assert_redirected_to new_enemy_url(NewEnemy.last)
  end

  test "should show new_enemy" do
    get new_enemy_url(@new_enemy)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_enemy_url(@new_enemy)
    assert_response :success
  end

  test "should update new_enemy" do
    patch new_enemy_url(@new_enemy), params: { new_enemy: { enemy: @new_enemy.enemy, generate_no: @new_enemy.generate_no, result_no: @new_enemy.result_no } }
    assert_redirected_to new_enemy_url(@new_enemy)
  end

  test "should destroy new_enemy" do
    assert_difference('NewEnemy.count', -1) do
      delete new_enemy_url(@new_enemy)
    end

    assert_redirected_to new_enemies_url
  end
end
