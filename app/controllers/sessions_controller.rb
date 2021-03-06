class SessionsController < ApplicationController
	# reroutes to /login when root url is given
	def index
		redirect_to "/login"
	end

	# GET: login page
	def new
		if !session[:student_id].nil?
			redirect_to "/students/#{session[:student_id]}"
		elsif !session[:instructor_id].nil?
			redirect_to "/instructors/#{session[:instructor_id]}"
		end
	end

	#DELETE: removes credentials
	def logout
		session[:student_id] = nil
		session[:instructor_id] = nil
		redirect_to "/login"
	end

	# POST: logging in from login page
	def create
		if params[:type] == "student"
			# First check if any fields are empty
			if params[:email] == ""
				flash[:errors_s_email] = true
			end
			if params[:password] == ""
				flash[:errors_s_password] = true
			end

			# if either of the fields are not filled out, redirect
			if flash[:errors_s_email] || flash[:errors_s_password]
				redirect_to "/login"
			# if both fields are filled out, find and confirm
			else
				stu = Student.find_by( email: params[:email] )
				if stu.nil? # can't find email
					flash[:errors_s_messages] = "Oops, we can't find your email in our database. Please email admissionscontact@codingdojo.com for help."
					redirect_to "/login"
				elsif !stu.authenticate params[:password] # wrong password
					flash[:errors_s_messages] = "Oops, provided email seems to be incorrrect. Please email admissionscontact@codingdojo.com for help."
					redirect_to "/login"
				else # all checks out
					session[:student_id] = stu.id
					redirect_to "/students/#{stu.id}"
				end
			end

		elsif params[:type] == "instructor"
			# First check if any fields are empty
			if params[:email] == ""
				flash[:errors_i_email] = true
			end
			if params[:password] == ""
				flash[:errors_i_password] = true
			end

			# if either of the fields are not filled out, redirect
			if flash[:errors_i_email] || flash[:errors_i_password]
				redirect_to "/login"
			# if both fields are filled out, find and confirm
			else
				ins = Instructor.find_by( email: params[:email] )
				if ins.nil? # can't find email
					flash[:errors_i_messages] = "Oops, we can't find your email in our database. Please email admissionscontact@codingdojo.com for help."
					redirect_to "/login"
				elsif !ins.authenticate params[:password] # wrong password
					flash[:errors_i_messages] = "Oops, provided email seems to be incorrrect. Please email admissionscontact@codingdojo.com for help."
					redirect_to "/login"
				else # all checks out
					session[:instructor_id] = ins.id
					redirect_to "/instructors/#{ins.id}"
				end
			end

		else
			# user should not reach this state by accident
			puts "Something went wrong! Wrong user type given!"
			redirect_to "/login"
		end # End of type check

	end # End of "create" method


	private
	def user_params
		params.require(:user).permit(
			:email,
			:password)
	end

end
