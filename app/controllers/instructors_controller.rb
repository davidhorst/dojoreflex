class InstructorsController < ApplicationController
  before_action :require_instructor_login, only: [ :show ]
  before_action :require_instructor_or_admin_login, only: [ :update, :update_picture, :edit ]
  before_action :require_correct_instructor, only: [ :show ]
  before_action :require_correct_instructor_or_admin, only: [ :update, :update_picture, :edit ]
  before_action :require_admin_only_login, only: [ :new ]
	
  def update
      user = current_instructor
      user = Instructor.update(user.id, user_params)
      if user.valid?
          render json: {:status => 'success'}
      end
  end

  def new

  end

  def update_picture
      user = Instructor.find(params[:id])
      user = Instructor.update(user.id, user_params)
      redirect_to  "/instructors/#{user.id}/edit"
  end

  def edit
      @user = current_instructor
      if current_instructor   #if the user is an admin they can edit additional fields
          if current_instructor.admin
              @admin = true
          else
              @admin = false
          end
      end

  end
private
  def user_params
      params.require(:user).permit(:name, :email, :website, :linkedin, :about, :age, :avatar)
  end

end
