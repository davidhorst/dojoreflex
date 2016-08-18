class Stack < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :language
  has_many :student_stacks
  has_many :students, through: :student_stacks
end
