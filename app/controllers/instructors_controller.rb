class InstructorsController < ApplicationController
  before_action :require_instructor_login, only: [ :show ]
  before_action :require_instructor_or_admin_login, only: [ :update, :update_picture, :edit ]
  before_action :require_correct_instructor, only: [ :show ]
  before_action :require_correct_instructor_or_admin, only: [ :update, :update_picture, :edit ]
  before_action :require_admin_only_login, only: [ :new, :create ]


  def update
      user = Instructor.find(params[:id])
      user = Instructor.update(user.id, user_params)
      if user.valid?
          render json: {:status => 'success'}
      end
  end

  def new
      @user = current_instructor
  end

  def show
@user = current_instructor
  end

  def admin
    @students = Student.all
    @instructors = Instructor.all
    @user = current_instructor
  end

  def create
      pw = SecureRandom.hex(8)
      ins = Instructor.new( user_params )
      ins.password = pw
      puts ins.admin
      if ins.valid?
          ins.save
          email = NewUser.NewInstructor(ins, pw).deliver_later
          redirect_to "/instructors/#{session[:instructor_id]}/admin"
      else
          flash[:errors] = ins.errors.full_messages
          redirect_to "/instructors/new"
      end
  end

  def update_picture
      user = Instructor.find(params[:id])
      user = Instructor.update(user.id, user_params)
      redirect_to  "/instructors/#{user.id}/edit"
  end

  def edit
      @user = Instructor.find(params[:id])
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
      params.require(:user).permit(:name, :email, :admin, :website, :linkedin, :about, :age, :avatar)
  end

end
