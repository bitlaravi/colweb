class CreateLabSpecilities < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_specilities do |t|
      t.references :department, foreign_key: true
      t.string :lab_name
      t.string :lab_incharge

      t.timestamps
    end
  end
end
