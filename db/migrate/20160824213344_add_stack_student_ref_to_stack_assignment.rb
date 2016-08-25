class AddStackStudentRefToStackAssignment < ActiveRecord::Migration
  def change
    add_reference :stack_assignments, :stack_student, index: true, foreign_key: true
  end
end
