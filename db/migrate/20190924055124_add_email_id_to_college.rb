class AddEmailIdToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :email_id, :string
  end
end
