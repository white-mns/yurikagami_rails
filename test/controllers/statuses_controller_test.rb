require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_status_url
    assert_response :success
  end

  test "should create status" do
    assert_difference('Status.count') do
      post statuses_url, params: { status: { agi: @status.agi, def: @status.def, e_no: @status.e_no, exp: @status.exp, generate_no: @status.generate_no, hp: @status.hp, hp_rate: @status.hp_rate, int: @status.int, job1: @status.job1, job2: @status.job2, lv: @status.lv, mexp: @status.mexp, mhp: @status.mhp, mmp: @status.mmp, money: @status.money, mp: @status.mp, mp_rate: @status.mp_rate, personality: @status.personality, result_no: @status.result_no, skill: @status.skill, sp: @status.sp, str: @status.str, sub_no: @status.sub_no, sundries: @status.sundries, tec: @status.tec, tribe: @status.tribe } }
    end

    assert_redirected_to status_url(Status.last)
  end

  test "should show status" do
    get status_url(@status)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_url(@status)
    assert_response :success
  end

  test "should update status" do
    patch status_url(@status), params: { status: { agi: @status.agi, def: @status.def, e_no: @status.e_no, exp: @status.exp, generate_no: @status.generate_no, hp: @status.hp, hp_rate: @status.hp_rate, int: @status.int, job1: @status.job1, job2: @status.job2, lv: @status.lv, mexp: @status.mexp, mhp: @status.mhp, mmp: @status.mmp, money: @status.money, mp: @status.mp, mp_rate: @status.mp_rate, personality: @status.personality, result_no: @status.result_no, skill: @status.skill, sp: @status.sp, str: @status.str, sub_no: @status.sub_no, sundries: @status.sundries, tec: @status.tec, tribe: @status.tribe } }
    assert_redirected_to status_url(@status)
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete status_url(@status)
    end

    assert_redirected_to statuses_url
  end
end
