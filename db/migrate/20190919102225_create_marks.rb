class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.references :student, foreign_key: true
      t.string :subject
      t.string :year
      t.string :mark
      t.string :result

      t.timestamps
    end
  end
end
