class Student < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  #connetions
  belongs_to :cohort
  has_many :stack_students
  has_many :stacks, through: :stack_students
  has_many :belts
  has_many :blackbelts, -> { where belt: 'black' }, :class_name => 'StackStudent'

  #validations
  has_secure_password :on => :create
  has_attached_file :avatar
  validates :email, :name, :cohort, presence: :true
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
