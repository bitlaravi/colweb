require 'test_helper'

class LabSpecilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_specility = lab_specilities(:one)
  end

  test "should get index" do
    get lab_specilities_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_specility_url
    assert_response :success
  end

  test "should create lab_specility" do
    assert_difference('LabSpecility.count') do
      post lab_specilities_url, params: { lab_specility: { department_id: @lab_specility.department_id, lab_incharge: @lab_specility.lab_incharge, lab_name: @lab_specility.lab_name } }
    end

    assert_redirected_to lab_specility_url(LabSpecility.last)
  end

  test "should show lab_specility" do
    get lab_specility_url(@lab_specility)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_specility_url(@lab_specility)
    assert_response :success
  end

  test "should update lab_specility" do
    patch lab_specility_url(@lab_specility), params: { lab_specility: { department_id: @lab_specility.department_id, lab_incharge: @lab_specility.lab_incharge, lab_name: @lab_specility.lab_name } }
    assert_redirected_to lab_specility_url(@lab_specility)
  end

  test "should destroy lab_specility" do
    assert_difference('LabSpecility.count', -1) do
      delete lab_specility_url(@lab_specility)
    end

    assert_redirected_to lab_specilities_url
  end
end
