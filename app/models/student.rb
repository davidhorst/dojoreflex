class Student < ActiveRecord::Base
  belongs_to :cohort
  has_many :stack_students
  has_many :stacks, through: :stack_students
  has_secure_password
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
