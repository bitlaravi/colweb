class AddUserIdToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :user_id, :integer
  end
end
