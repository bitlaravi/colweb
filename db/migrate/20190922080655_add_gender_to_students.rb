class AddGenderToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :gender, :string
  end
end
