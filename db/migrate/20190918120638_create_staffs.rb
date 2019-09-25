class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.references :department, foreign_key: true
      t.references :college, foreign_key: true
      t.string :staff_name
      t.string :age
      t.string :posission
      t.string :experience
      t.string :contact_no
      t.string :email_id

      t.timestamps
    end
  end
end
