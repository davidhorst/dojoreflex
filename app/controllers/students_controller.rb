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

    def update_picture
        user = Student.find(params[:id])
        user = Student.update(user.id, user_params)
        redirect_to  "/students/#{user.id}"
    end

    def edit
        user = Student.find(params[:id])
        user = Student.update(user.id, user_params)
        if user.valid?
            render json: {:status => 'success'  }
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :website, :linkedin, :about, :age, :avatar)
    end
end
