require 'json'
require 'securerandom'

class StudentsController < ApplicationController
    before_action :require_student_login, only: [ :show ]
    before_action :require_student_or_admin_login, only: [ :update, :update_picture, :edit ]
    before_action :require_correct_student, only: [ :show ]
    before_action :require_correct_student_or_admin, only: [ :update, :update_picture, :edit ]
    before_action :require_admin_only_login, only: [ :new, :create ]

    def show
        @alerts = Alert.all
        @current_student = current_student
        @weekcount = Date.today.strftime("%U").to_i - current_student.cohort.start.strftime("%U").to_i
        @language = current_student.stacks.where(active:true).first.language.name
        @students = Student.all

    end

    def new
        @cohorts = Cohort.includes(:location).where("start > ?", Date.today)
    end

    def create
        pw = SecureRandom.hex(8)
        stu = Student.new( user_params )
        stu.password = pw
        if stu.valid?
            stu.save
            email = NewUser.NewStudent(stu, pw).deliver_later
            joinFirstTwoStacks(stu)
            redirect_to "/instructors/#{session[:instructor_id]}/admin"
        else
            flash[:errors] = stu.errors.full_messages
            redirect_to "/students/new"
        end
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


    def feedback
      input = params.require(:input).permit(:id, :value)

      if input[:id] == 'performance'
        Student.find(current_student.id).update(happy: input[:value])
      end
      if input[:id] == 'help'
        Student.find(current_student.id).update(help: input[:value])
      end

      @students = Student.all


      respond_to do |format|
        format.js
      end
    end

    def user_params
        params.require(:user).permit(:name, :email, :cohort_id, :website, :linkedin, :about, :age, :avatar)
    end

    def joinFirstTwoStacks student
        start_date = student.cohort.start
        stack_webfund = Stack.find_by(start_date: start_date, language_id: 1)
        stack_python = Stack.find_by(start_date: start_date + 1.month, language_id: 2)
        StackStudent.create(student: student, stack: stack_webfund, order: 1)
        StackStudent.create(student: student, stack: stack_python, order: 2)

    end
    
  end
