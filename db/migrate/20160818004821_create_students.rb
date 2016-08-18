class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :website
      t.string :linkedin
      t.text :about
      t.integer :age
      t.boolean :active
      t.boolean :happy
      t.boolean :help
      t.references :cohort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
