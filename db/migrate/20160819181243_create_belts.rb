class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|
      t.references :student, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true
      t.string :belt

      t.timestamps null: false
    end
  end
end
