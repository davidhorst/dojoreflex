class Student < ActiveRecord::Base
  belongs_to :cohort
  has_many :student_stacks
  has_many :stacks, through: :student_stacks
  has_secure_password
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
