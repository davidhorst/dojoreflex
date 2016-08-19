require 'json'
class StudentsController < ApplicationController

    if :admin_check?
        before_action :current_instructor, only: [:show]
    else
        before_action :require_correct_student
    end

    def admin_check?
        if session[:instructor_id]
            true
            false
        end
    end

    def new
    end

    def show
        @user = Student.find(params[:id])

    end


    def edit
        user = Student.find(params[:id])
        Student.update(user.id, user_update_params)

        json_message = {:status => 'success', :message => 'Thank you! We have created a new user!'}
        render json: json_message
    end
    #   respond_to do |format|
    #
    #
    #         msg = { :status => "ok", :message => "Success!" }
    #        format.json  { render :json => msg  }
    #        format.html { }
    #    end

    #   if user.valid?
    #      redirect_to "/students/#{user.id.to_s}"
    #   else
    #       flash[:errors] = user.errors.full_messages
    #       redirect_to "/students/#{user.id.to_s}"
    #   end



    private
    def user_update_params
        params.require(:user).permit(:name, :email, :website, :linkedin, :about, :age)
    end
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :avatar)
    end
end
