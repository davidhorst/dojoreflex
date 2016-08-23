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
			redirect_to '/login'
		end
	end

	def require_instructor_login
		if session[:instructor_id] == nil
			redirect_to '/login'
		end
	end

	def require_student_or_admin_login
		stu_id = session[:student_id]
		ins_id = session[:instructor_id]
		if stu_id == nil && ins_id == nil
			redirect_to '/login'
		elsif stu_id == nil && current_instructor.admin != true
			redirect_to "/instructors/#{session[:instructor_id]}"
		end
	end

	def require_instructor_or_admin_login
		ins_id = session[:instructor_id]
		if ins_id == nil
			redirect_to '/login'
		# elsif current_instructor.admin != true
		# 	redirect_to "/instructors/#{session[:instructor_id]}"
		end
	end

	def require_admin_only_login
		user=current_instructor
		if user.nil? || user.admin != true
			redirect_to "/login"
		end
	end

	# authorization helper methods: recommened to be used with "before_action" in controller
	def require_correct_student
		user = Student.find_by(id: params[:id])
		redirect_to "/students/#{session[:student_id]}" if user.nil? or session[:student_id] != user.id
	end

	def require_correct_instructor
		user = Instructor.find_by(id: params[:id])
		redirect_to "/instructors/#{session[:instructor_id]}" if user.nil? or session[:instructor_id] != user.id
	end

	def require_correct_student_or_admin
		user = Student.find_by(id: params[:id])
		if !session[:student_id].nil?
			redirect_to "/students/#{session[:student_id]}" if session[:student_id] != user.id
		elsif !session[:instructor_id].nil?
			redirect_to "/instructors/#{session[:instructor_id]}" if current_instructor.admin != true
		end
	end

	def require_correct_instructor_or_admin
		user = Instructor.find_by(id: params[:id])
		redirect_to "/instructors/#{session[:instructor_id]}" if current_instructor.admin != true && session[:instructor_id] != user.id
	end



	# List of helper methods available in "views"
	helper_method :current_student, :current_instructor
	helper_method :require_student_login, :require_instructor_login, :require_student_or_admin_login, :require_instructor_or_admin_login
	helper_method :require_correct_student, :require_correct_instructor, :require_correct_student_or_admin, :require_correct_instructor_or_admin


	private

	# clears any and all user sessions
	def clear_session
		session[:student_id] = nil
		session[:instructor_id] = nil
	end
end
