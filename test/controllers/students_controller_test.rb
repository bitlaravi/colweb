require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { accomadation: @student.accomadation, address1: @student.address1, address2: @student.address2, adhar_no: @student.adhar_no, age: @student.age, city: @student.city, college_id: @student.college_id, date_of_joining: @student.date_of_joining, department_id: @student.department_id, district: @student.district, dob: @student.dob, fathers_name: @student.fathers_name, hsc_perscentage: @student.hsc_perscentage, hslc_perscentage: @student.hslc_perscentage, mothers_name: @student.mothers_name, pan_no: @student.pan_no, pin: @student.pin, semester: @student.semester, state: @student.state, student_name: @student.student_name, year: @student.year } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { accomadation: @student.accomadation, address1: @student.address1, address2: @student.address2, adhar_no: @student.adhar_no, age: @student.age, city: @student.city, college_id: @student.college_id, date_of_joining: @student.date_of_joining, department_id: @student.department_id, district: @student.district, dob: @student.dob, fathers_name: @student.fathers_name, hsc_perscentage: @student.hsc_perscentage, hslc_perscentage: @student.hslc_perscentage, mothers_name: @student.mothers_name, pan_no: @student.pan_no, pin: @student.pin, semester: @student.semester, state: @student.state, student_name: @student.student_name, year: @student.year } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
