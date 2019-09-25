class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.references :college, foreign_key: true
      t.references :department, foreign_key: true
      t.string :student_name
      t.string :fathers_name
      t.string :mothers_name
      t.string :dob
      t.integer :age
      t.string :hslc_perscentage
      t.string :hsc_perscentage
      t.string :year
      t.string :semester
      t.string :accomadation
      t.string :date_of_joining
      t.string :address1
      t.string :address2
      t.string :city
      t.string :district
      t.string :pin
      t.string :state
      t.string :adhar_no
      t.string :pan_no

      t.timestamps
    end
  end
end
