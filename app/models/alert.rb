class Alert < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :location
  belongs_to :stack
end
