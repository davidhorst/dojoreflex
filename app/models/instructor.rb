class Instructor < ActiveRecord::Base
  belongs_to :location
  has_secure_password
  has_many :stacks
end
