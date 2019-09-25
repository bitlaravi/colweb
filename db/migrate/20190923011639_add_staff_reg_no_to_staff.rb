class AddStaffRegNoToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :staff_reg_no, :string
  end
end
