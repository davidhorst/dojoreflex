class Stack < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :language
  belongs_to :location
  has_many :belts
  has_many :stack_students
  has_many :students, through: :stack_students
end
