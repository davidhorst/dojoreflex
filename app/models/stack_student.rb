class StackStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :student, :inverse_of => :blackbelts , :counter_cache => :blackbelt_count
  belongs_to :stack

end
