require "application_system_test_case"

class LabSpecilitiesTest < ApplicationSystemTestCase
  setup do
    @lab_specility = lab_specilities(:one)
  end

  test "visiting the index" do
    visit lab_specilities_url
    assert_selector "h1", text: "Lab Specilities"
  end

  test "creating a Lab specility" do
    visit lab_specilities_url
    click_on "New Lab Specility"

    fill_in "Department", with: @lab_specility.department_id
    fill_in "Lab incharge", with: @lab_specility.lab_incharge
    fill_in "Lab name", with: @lab_specility.lab_name
    click_on "Create Lab specility"

    assert_text "Lab specility was successfully created"
    click_on "Back"
  end

  test "updating a Lab specility" do
    visit lab_specilities_url
    click_on "Edit", match: :first

    fill_in "Department", with: @lab_specility.department_id
    fill_in "Lab incharge", with: @lab_specility.lab_incharge
    fill_in "Lab name", with: @lab_specility.lab_name
    click_on "Update Lab specility"

    assert_text "Lab specility was successfully updated"
    click_on "Back"
  end

  test "destroying a Lab specility" do
    visit lab_specilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lab specility was successfully destroyed"
  end
end
