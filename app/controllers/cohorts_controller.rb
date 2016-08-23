class CohortsController < ApplicationController
	def new
		@locations = Location.all
		today = Date.today
		@min_date = "%04d-%02d" % [ today.year+((today.mon+1)/12), (today.mon+1)%12 ]
	end

	def create
		if !params[:cohort][:start].nil?
			params[:cohort][:start] << "-01"
		end

		new_cohort = Cohort.new( cohort_params )
		
		if new_cohort.valid?
			new_cohort.active = true
			new_cohort.save
			redirect_to "/instructors/#{session[:instructor_id]}/admin"	
		else
			flash[:errors] = new_cohort.errors.full_messages
			redirect_to "/cohorts/new"	
		end
				
	end


	private 

	def cohort_params
		params.require(:cohort).permit(	
			:location_id, 
			:start)
	end
end
