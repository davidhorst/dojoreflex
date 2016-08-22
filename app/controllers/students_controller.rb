require 'json'
class StudentsController < ApplicationController

    # if :not_admin_check?
    #     before_action :require_correct_student
    # end
    #
    # def not_admin_check?
    #     if current_instructor.admin
    #         false
    #     end
    #     true
    #
    # end



    def show
        @alerts = Alert.all
        @current_student = current_student
        @weekcount = Date.today.strftime("%U").to_i - current_student.cohort.start.strftime("%U").to_i
        @language = current_student.stacks.where(active:true).first.language.name

    end

    def new
    end

    def edit
        if current_instructor
            if current_instructor.admin
                puts current_instructor
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
        redirect_to  "/students/#{user.id}/edit"
    end

    def update
        user = Student.find(params[:id])
        user = Student.update(user.id, user_params)
        if user.valid?
            render json: {:status => 'success'  }
        end
    end

    def dashboard
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

    def user_params
        params.require(:user).permit(:name, :email, :website, :linkedin, :about, :age, :avatar)
    end
end
