class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.references :instructor, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.date :start_date
      t.boolean :active

      t.timestamps null: false
    end
  end
end
