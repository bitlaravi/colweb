class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.references :college, foreign_key: true
      t.string :department_name
      t.string :department_code

      t.timestamps
    end
  end
end
