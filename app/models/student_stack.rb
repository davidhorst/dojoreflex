class StudentStack < ActiveRecord::Base
  belongs_to :student
  belongs_to :stack
end
