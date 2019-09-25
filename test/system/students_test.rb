require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Accomadation", with: @student.accomadation
    fill_in "Address1", with: @student.address1
    fill_in "Address2", with: @student.address2
    fill_in "Adhar no", with: @student.adhar_no
    fill_in "Age", with: @student.age
    fill_in "City", with: @student.city
    fill_in "College", with: @student.college_id
    fill_in "Date of joining", with: @student.date_of_joining
    fill_in "Department", with: @student.department_id
    fill_in "District", with: @student.district
    fill_in "Dob", with: @student.dob
    fill_in "Fathers name", with: @student.fathers_name
    fill_in "Hsc perscentage", with: @student.hsc_perscentage
    fill_in "Hslc perscentage", with: @student.hslc_perscentage
    fill_in "Mothers name", with: @student.mothers_name
    fill_in "Pan no", with: @student.pan_no
    fill_in "Pin", with: @student.pin
    fill_in "Semester", with: @student.semester
    fill_in "State", with: @student.state
    fill_in "Student name", with: @student.student_name
    fill_in "Year", with: @student.year
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Accomadation", with: @student.accomadation
    fill_in "Address1", with: @student.address1
    fill_in "Address2", with: @student.address2
    fill_in "Adhar no", with: @student.adhar_no
    fill_in "Age", with: @student.age
    fill_in "City", with: @student.city
    fill_in "College", with: @student.college_id
    fill_in "Date of joining", with: @student.date_of_joining
    fill_in "Department", with: @student.department_id
    fill_in "District", with: @student.district
    fill_in "Dob", with: @student.dob
    fill_in "Fathers name", with: @student.fathers_name
    fill_in "Hsc perscentage", with: @student.hsc_perscentage
    fill_in "Hslc perscentage", with: @student.hslc_perscentage
    fill_in "Mothers name", with: @student.mothers_name
    fill_in "Pan no", with: @student.pan_no
    fill_in "Pin", with: @student.pin
    fill_in "Semester", with: @student.semester
    fill_in "State", with: @student.state
    fill_in "Student name", with: @student.student_name
    fill_in "Year", with: @student.year
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
