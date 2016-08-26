class Stack < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :language
  belongs_to :location
  has_many :belts
  has_many :stack_students
  has_many :students, through: :stack_students
  has_many :assignments, foreign_key: "stack_id", class_name: "StackAssignment"
  has_many :stack_assignments

end
