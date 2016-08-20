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
        user = Student.update(user.id, user_params)

      respond_to do |format|
           format.json  {
               if user.valid?
                #    json_message = {:status => 'success', :message => 'Thank you! We have updated a new user!', :user => user}
                #    render json: json_message
               else
                   render :json => @error_object.to_json, :status => :unprocessable_entity
               end
            }
           format.html {
               redirect_to  "/students/#{user.id}"
            }
       end
   end

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
