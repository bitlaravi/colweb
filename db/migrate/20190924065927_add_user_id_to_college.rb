	class AddUserIdToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :user_id, :string
  end
end
