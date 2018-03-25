require 'test_helper'

class LearnableSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learnable_skill = learnable_skills(:one)
  end

  test "should get index" do
    get learnable_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_learnable_skill_url
    assert_response :success
  end

  test "should create learnable_skill" do
    assert_difference('LearnableSkill.count') do
      post learnable_skills_url, params: { learnable_skill: { chara_type: @learnable_skill.chara_type, job_id: @learnable_skill.job_id, skill_id: @learnable_skill.skill_id, skill_no: @learnable_skill.skill_no, sp: @learnable_skill.sp } }
    end

    assert_redirected_to learnable_skill_url(LearnableSkill.last)
  end

  test "should show learnable_skill" do
    get learnable_skill_url(@learnable_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_learnable_skill_url(@learnable_skill)
    assert_response :success
  end

  test "should update learnable_skill" do
    patch learnable_skill_url(@learnable_skill), params: { learnable_skill: { chara_type: @learnable_skill.chara_type, job_id: @learnable_skill.job_id, skill_id: @learnable_skill.skill_id, skill_no: @learnable_skill.skill_no, sp: @learnable_skill.sp } }
    assert_redirected_to learnable_skill_url(@learnable_skill)
  end

  test "should destroy learnable_skill" do
    assert_difference('LearnableSkill.count', -1) do
      delete learnable_skill_url(@learnable_skill)
    end

    assert_redirected_to learnable_skills_url
  end
end
