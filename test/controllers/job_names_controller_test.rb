require 'test_helper'

class JobNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_name = job_names(:one)
  end

  test "should get index" do
    get job_names_url
    assert_response :success
  end

  test "should get new" do
    get new_job_name_url
    assert_response :success
  end

  test "should create job_name" do
    assert_difference('JobName.count') do
      post job_names_url, params: { job_name: { job_id: @job_name.job_id, name: @job_name.name } }
    end

    assert_redirected_to job_name_url(JobName.last)
  end

  test "should show job_name" do
    get job_name_url(@job_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_name_url(@job_name)
    assert_response :success
  end

  test "should update job_name" do
    patch job_name_url(@job_name), params: { job_name: { job_id: @job_name.job_id, name: @job_name.name } }
    assert_redirected_to job_name_url(@job_name)
  end

  test "should destroy job_name" do
    assert_difference('JobName.count', -1) do
      delete job_name_url(@job_name)
    end

    assert_redirected_to job_names_url
  end
end
