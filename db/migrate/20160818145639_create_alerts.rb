class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :cohort, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
