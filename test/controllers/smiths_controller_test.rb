require 'test_helper'

class SmithsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smith = smiths(:one)
  end

  test "should get index" do
    get smiths_url
    assert_response :success
  end

  test "should get new" do
    get new_smith_url
    assert_response :success
  end

  test "should create smith" do
    assert_difference('Smith.count') do
      post smiths_url, params: { smith: { e_no: @smith.e_no, generate_no: @smith.generate_no, last_generate_no: @smith.last_generate_no, last_result_no: @smith.last_result_no, main_material_i_no: @smith.main_material_i_no, main_material_name_id: @smith.main_material_name_id, party_no: @smith.party_no, result_i_no: @smith.result_i_no, result_no: @smith.result_no, source_i_no: @smith.source_i_no, sub_material_1_i_no: @smith.sub_material_1_i_no, sub_material_1_name_id: @smith.sub_material_1_name_id, sub_material_2_i_no: @smith.sub_material_2_i_no, sub_material_2_name_id: @smith.sub_material_2_name_id, sub_material_3_i_no: @smith.sub_material_3_i_no, sub_material_3_name_id: @smith.sub_material_3_name_id, sub_material_4_i_no: @smith.sub_material_4_i_no, sub_material_4_name_id: @smith.sub_material_4_name_id } }
    end

    assert_redirected_to smith_url(Smith.last)
  end

  test "should show smith" do
    get smith_url(@smith)
    assert_response :success
  end

  test "should get edit" do
    get edit_smith_url(@smith)
    assert_response :success
  end

  test "should update smith" do
    patch smith_url(@smith), params: { smith: { e_no: @smith.e_no, generate_no: @smith.generate_no, last_generate_no: @smith.last_generate_no, last_result_no: @smith.last_result_no, main_material_i_no: @smith.main_material_i_no, main_material_name_id: @smith.main_material_name_id, party_no: @smith.party_no, result_i_no: @smith.result_i_no, result_no: @smith.result_no, source_i_no: @smith.source_i_no, sub_material_1_i_no: @smith.sub_material_1_i_no, sub_material_1_name_id: @smith.sub_material_1_name_id, sub_material_2_i_no: @smith.sub_material_2_i_no, sub_material_2_name_id: @smith.sub_material_2_name_id, sub_material_3_i_no: @smith.sub_material_3_i_no, sub_material_3_name_id: @smith.sub_material_3_name_id, sub_material_4_i_no: @smith.sub_material_4_i_no, sub_material_4_name_id: @smith.sub_material_4_name_id } }
    assert_redirected_to smith_url(@smith)
  end

  test "should destroy smith" do
    assert_difference('Smith.count', -1) do
      delete smith_url(@smith)
    end

    assert_redirected_to smiths_url
  end
end
