class StackAssignment < ActiveRecord::Base
  belongs_to :student
  belongs_to :stack
  belongs_to :stack_student, :counter_cache => :assignment_count
end
