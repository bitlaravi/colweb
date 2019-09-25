json.extract! attendence, :id, :student_id, :total_hours, :present, :absent, :average, :exam_eligibility, :created_at, :updated_at
json.url attendence_url(attendence, format: :json)
