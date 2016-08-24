class Location < ActiveRecord::Base
    has_many :cohorts
    has_many :instructors
    has_many :stacks
end
