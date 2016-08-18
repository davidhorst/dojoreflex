class Location < ActiveRecord::Base
    has_many :cohorts
    has_many :instructors
end
