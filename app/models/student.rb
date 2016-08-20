class Student < ActiveRecord::Base
  belongs_to :cohort

  has_many :student_stacks
  has_many :stacks, through: :student_stacks
  has_secure_password :on => :create

  has_attached_file :avatar
  # will validate if the file is an image
  # validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  do_not_validate_attachment_file_type :avatar
  

end
