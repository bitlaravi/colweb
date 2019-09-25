class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.references :student, foreign_key: true
      t.string :year
      t.string :semester
      t.string :total_hours
      t.string :present
      t.string :absent
      t.string :average
      t.string :exam_eligibility

      t.timestamps
    end
  end
end
