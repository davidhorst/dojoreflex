class Cohort < ActiveRecord::Base
	belongs_to :location
	has_many :students

	validates :location, :start, presence: :true
	validate :future_start_date


	private

	def future_start_date
		if start.nil? || start < Date.today
			errors.add(:start, "must be a future date")
		end
	end
end
