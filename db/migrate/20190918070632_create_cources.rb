class CreateCources < ActiveRecord::Migration[5.2]
  def change
    create_table :cources do |t|
      t.references :college, foreign_key: true
      t.references :department, foreign_key: true
      t.string :cource

      t.timestamps
    end
  end
end
