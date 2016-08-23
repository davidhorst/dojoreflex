class Instructor < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  belongs_to :location
  has_many :stacks
  has_attached_file :avatar


  #validations
  has_secure_password
  validates :email, :name, presence: :true
  validates :admin, inclusion: { in: [true, false] }
  validates :email, :uniqueness => true, :format => { :with => EMAIL_REGEX }
  before_validation :downcase_email

  # will validate if the file is an image
  # s_attachment_content_type :avatar, :content_type => /\Aimage/
  # will validate .png and .jpg images only
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /JPG\Z/]


  private
  
  def downcase_email
    self.email.downcase! unless self.email.blank?
  end

end
