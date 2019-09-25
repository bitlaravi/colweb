require "application_system_test_case"

class CourcesTest < ApplicationSystemTestCase
  setup do
    @cource = cources(:one)
  end

  test "visiting the index" do
    visit cources_url
    assert_selector "h1", text: "Cources"
  end

  test "creating a Cource" do
    visit cources_url
    click_on "New Cource"

    fill_in "College", with: @cource.college_id
    fill_in "Cource", with: @cource.cource
    fill_in "Department", with: @cource.department_id
    click_on "Create Cource"

    assert_text "Cource was successfully created"
    click_on "Back"
  end

  test "updating a Cource" do
    visit cources_url
    click_on "Edit", match: :first

    fill_in "College", with: @cource.college_id
    fill_in "Cource", with: @cource.cource
    fill_in "Department", with: @cource.department_id
    click_on "Update Cource"

    assert_text "Cource was successfully updated"
    click_on "Back"
  end

  test "destroying a Cource" do
    visit cources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cource was successfully destroyed"
  end
end
