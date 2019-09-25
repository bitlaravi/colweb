class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :college
      t.references :department, foreign_key: true
      t.string :subject_code
      t.string :subject

      t.timestamps
    end
  end
end
