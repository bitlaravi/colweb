json.extract! student, :id, :college_id, :department_id, :student_name, :fathers_name, :mothers_name, :dob, :age, :hslc_perscentage, :hsc_perscentage, :year, :semester, :accomadation, :date_of_joining, :address1, :address2, :city, :district, :pin, :state, :adhar_no, :pan_no, :created_at, :updated_at
json.url student_url(student, format: :json)
