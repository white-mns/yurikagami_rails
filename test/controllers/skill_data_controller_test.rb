require 'test_helper'

class SkillDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill_datum = skill_data(:one)
  end

  test "should get index" do
    get skill_data_url
    assert_response :success
  end

  test "should get new" do
    get new_skill_datum_url
    assert_response :success
  end

  test "should create skill_datum" do
    assert_difference('SkillDatum.count') do
      post skill_data_url, params: { skill_datum: { at: @skill_datum.at, ct: @skill_datum.ct, element: @skill_datum.element, mp: @skill_datum.mp, name: @skill_datum.name, property: @skill_datum.property, range: @skill_datum.range, skill_id: @skill_datum.skill_id, target: @skill_datum.target, text: @skill_datum.text, timing: @skill_datum.timing } }
    end

    assert_redirected_to skill_datum_url(SkillDatum.last)
  end

  test "should show skill_datum" do
    get skill_datum_url(@skill_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_skill_datum_url(@skill_datum)
    assert_response :success
  end

  test "should update skill_datum" do
    patch skill_datum_url(@skill_datum), params: { skill_datum: { at: @skill_datum.at, ct: @skill_datum.ct, element: @skill_datum.element, mp: @skill_datum.mp, name: @skill_datum.name, property: @skill_datum.property, range: @skill_datum.range, skill_id: @skill_datum.skill_id, target: @skill_datum.target, text: @skill_datum.text, timing: @skill_datum.timing } }
    assert_redirected_to skill_datum_url(@skill_datum)
  end

  test "should destroy skill_datum" do
    assert_difference('SkillDatum.count', -1) do
      delete skill_datum_url(@skill_datum)
    end

    assert_redirected_to skill_data_url
  end
end
