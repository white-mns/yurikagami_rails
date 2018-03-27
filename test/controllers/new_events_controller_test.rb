require 'test_helper'

class NewEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_event = new_events(:one)
  end

  test "should get index" do
    get new_events_url
    assert_response :success
  end

  test "should get new" do
    get new_new_event_url
    assert_response :success
  end

  test "should create new_event" do
    assert_difference('NewEvent.count') do
      post new_events_url, params: { new_event: { event: @new_event.event, flag: @new_event.flag, generate_no: @new_event.generate_no, result_no: @new_event.result_no } }
    end

    assert_redirected_to new_event_url(NewEvent.last)
  end

  test "should show new_event" do
    get new_event_url(@new_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_event_url(@new_event)
    assert_response :success
  end

  test "should update new_event" do
    patch new_event_url(@new_event), params: { new_event: { event: @new_event.event, flag: @new_event.flag, generate_no: @new_event.generate_no, result_no: @new_event.result_no } }
    assert_redirected_to new_event_url(@new_event)
  end

  test "should destroy new_event" do
    assert_difference('NewEvent.count', -1) do
      delete new_event_url(@new_event)
    end

    assert_redirected_to new_events_url
  end
end
