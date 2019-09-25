class AddRegisterNoToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :register_no, :string
  end
end
