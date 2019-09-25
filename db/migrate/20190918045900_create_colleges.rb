class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :college_name
      t.string :college_code
      t.string :location
      t.string :college_type
      t.string :university

      t.timestamps
    end
  end
end
