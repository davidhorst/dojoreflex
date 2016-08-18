class Student < ActiveRecord::Base
  belongs_to :cohort
  has_many :student_stacks
  has_many :stacks, through: :student_stacks
  has_secure_password
end
