require "application_system_test_case"

class CollegesTest < ApplicationSystemTestCase
  setup do
    @college = colleges(:one)
  end

  test "visiting the index" do
    visit colleges_url
    assert_selector "h1", text: "Colleges"
  end

  test "creating a College" do
    visit colleges_url
    click_on "New College"

    fill_in "College code", with: @college.college_code
    fill_in "College name", with: @college.college_name
    fill_in "College type", with: @college.college_type
    fill_in "Location", with: @college.location
    fill_in "University", with: @college.university
    click_on "Create College"

    assert_text "College was successfully created"
    click_on "Back"
  end

  test "updating a College" do
    visit colleges_url
    click_on "Edit", match: :first

    fill_in "College code", with: @college.college_code
    fill_in "College name", with: @college.college_name
    fill_in "College type", with: @college.college_type
    fill_in "Location", with: @college.location
    fill_in "University", with: @college.university
    click_on "Update College"

    assert_text "College was successfully updated"
    click_on "Back"
  end

  test "destroying a College" do
    visit colleges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "College was successfully destroyed"
  end
end
