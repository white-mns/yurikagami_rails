require 'test_helper'

class EventProceedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_proceed = event_proceeds(:one)
  end

  test "should get index" do
    get event_proceeds_url
    assert_response :success
  end

  test "should get new" do
    get new_event_proceed_url
    assert_response :success
  end

  test "should create event_proceed" do
    assert_difference('EventProceed.count') do
      post event_proceeds_url, params: { event_proceed: { e_no: @event_proceed.e_no, event: @event_proceed.event, flag: @event_proceed.flag, generate_no: @event_proceed.generate_no, last_flag: @event_proceed.last_flag, result_no: @event_proceed.result_no, sub_no: @event_proceed.sub_no } }
    end

    assert_redirected_to event_proceed_url(EventProceed.last)
  end

  test "should show event_proceed" do
    get event_proceed_url(@event_proceed)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_proceed_url(@event_proceed)
    assert_response :success
  end

  test "should update event_proceed" do
    patch event_proceed_url(@event_proceed), params: { event_proceed: { e_no: @event_proceed.e_no, event: @event_proceed.event, flag: @event_proceed.flag, generate_no: @event_proceed.generate_no, last_flag: @event_proceed.last_flag, result_no: @event_proceed.result_no, sub_no: @event_proceed.sub_no } }
    assert_redirected_to event_proceed_url(@event_proceed)
  end

  test "should destroy event_proceed" do
    assert_difference('EventProceed.count', -1) do
      delete event_proceed_url(@event_proceed)
    end

    assert_redirected_to event_proceeds_url
  end
end
