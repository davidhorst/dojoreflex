class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.references :location, index: true, foreign_key: true
      t.date :start
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
