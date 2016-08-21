class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# session helper methods: obtain user objects from session id
	def current_student
		Student.find(session[:student_id]) if session[:student_id]
	end

	def current_instructor
		Instructor.find(session[:instructor_id]) if session[:instructor_id]
	end

	# authentication helper methods: recommened to be used with "before_action" in controllers
	def require_student_login
		if session[:student_id] == nil
			clear_session
			flash[:errors] = ["please log in as a student"]
			redirect_to '/login'
		end
	end

	def require_instructor_login
		if session[:instructor_id] == nil
			clear_session
			flash[:errors] = ["please log in as a instructor"]
			redirect_to '/login'
		end
	end

	# authorization helper methods: recommened to be used with "before_action" in controllers
	def require_correct_student
		user = Student.find_by(id: params[:id])
		redirect_to "/students/#{session[:student_id]}" if user.nil? or session[:student_id] != user.id
	end

	def require_correct_instructor
		user = Instructor.find_by(id: params[:id])
		redirect_to "/instructor/#{session[:instructor_id]}" if user.nil? or session[:instructor_id] != user.id
	end

	# List of helper methods available in "views"
	helper_method :current_lender, :current_borrower, :get_states


	private

	# clears any and all user sessions
	def clear_session
		session[:student_id] = nil
		session[:instructor_id] = nil
	end
end
