class CreateStackStudents < ActiveRecord::Migration
  def change
    create_table :stack_students do |t|
      t.references :student, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true
      t.boolean :blackbelt
      t.integer :order

      t.timestamps null: false
    end
  end
end
