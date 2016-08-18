class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.references :location, index: true, foreign_key: true
      t.string :linkedin
      t.string :website
      t.string :password_digest
      t.text :about
      t.boolean :admin
      t.boolean :actie

      t.timestamps null: false
    end
  end
end
