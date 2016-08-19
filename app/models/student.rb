class Student < ActiveRecord::Base
  belongs_to :cohort
  has_many :stack_students
  has_many :stacks, through: :stack_student
  has_secure_password
end
