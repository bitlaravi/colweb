class AddUserIdEmailIdToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :user_id, :integer
    add_column :departments, :email_id, :string
  end
end
