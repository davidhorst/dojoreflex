class RemoveActieFromInstructor < ActiveRecord::Migration
  def change
    remove_column :instructors, :actie, :boolean
  end
end
