# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_24_071019) do

  create_table "attendences", force: :cascade do |t|
    t.integer "student_id"
    t.string "year"
    t.string "semester"
    t.string "total_hours"
    t.string "present"
    t.string "absent"
    t.string "average"
    t.string "exam_eligibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendences_on_student_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "college_name"
    t.string "college_code"
    t.string "location"
    t.string "college_type"
    t.string "university"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_id"
    t.string "user_id"
  end

  create_table "cources", force: :cascade do |t|
    t.integer "college_id"
    t.integer "department_id"
    t.string "cource"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_cources_on_college_id"
    t.index ["department_id"], name: "index_cources_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "college_id"
    t.string "department_name"
    t.string "department_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email_id"
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "lab_specilities", force: :cascade do |t|
    t.integer "department_id"
    t.string "lab_name"
    t.string "lab_incharge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_lab_specilities_on_department_id"
  end

  create_table "marks", force: :cascade do |t|
    t.integer "student_id"
    t.string "subject"
    t.string "year"
    t.string "mark"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_marks_on_student_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "department_id"
    t.integer "college_id"
    t.string "staff_name"
    t.string "age"
    t.string "posission"
    t.string "experience"
    t.string "contact_no"
    t.string "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "staff_reg_no"
    t.string "user_id"
    t.index ["college_id"], name: "index_staffs_on_college_id"
    t.index ["department_id"], name: "index_staffs_on_department_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "college_id"
    t.integer "department_id"
    t.string "student_name"
    t.string "fathers_name"
    t.string "mothers_name"
    t.string "dob"
    t.integer "age"
    t.string "hslc_perscentage"
    t.string "hsc_perscentage"
    t.string "year"
    t.string "semester"
    t.string "accomadation"
    t.string "date_of_joining"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "district"
    t.string "pin"
    t.string "state"
    t.string "adhar_no"
    t.string "pan_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "register_no"
    t.string "gender"
    t.string "email"
    t.string "password"
    t.string "user_id"
    t.index ["college_id"], name: "index_students_on_college_id"
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "college_id"
    t.integer "department_id"
    t.string "subject_code"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_subjects_on_college_id"
    t.index ["department_id"], name: "index_subjects_on_department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
