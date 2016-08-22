require 'json'
class StudentsController < ApplicationController

    if :not_admin_check?
        before_action :require_correct_student
    end

    def not_admin_check?
        if current_instructor.admin
            false
        end
        true

    end

    def index
        @alerts = Alert.all

    end

    def new
    end

    def edit
        if current_instructor
            puts current_instructor.admin
            if current_instructor.admin
                @admin = true
            else
                @admin = false
            end
        end
        @user = Student.find(params[:id])

    end

    def update_picture
        user = Student.find(params[:id])
        user = Student.update(user.id, user_params)
        redirect_to  "/students/#{user.id}"
    end

    def update
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
