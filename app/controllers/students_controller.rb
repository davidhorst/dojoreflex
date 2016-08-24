require 'json'
require 'securerandom'
require 'csv'

class StudentsController < ApplicationController
    before_action :require_student_login, only: [ :show ]
    before_action :require_student_or_admin_login, only: [ :update, :update_picture, :edit ]
    before_action :require_correct_student, only: [ :show ]
    before_action :require_correct_student_or_admin, only: [ :update, :update_picture, :edit ]
    before_action :require_admin_only_login, only: [ :new, :create, :csv_create ]

    def show
        @alerts = Alert.all
        @user = current_student
        @weekcount = Date.today.strftime("%U").to_i - current_student.cohort.start.strftime("%U").to_i
        @language = current_student.stacks.where(active:true).first.language.name
        @students = Student.all
    end

    def new
        @cohorts = Cohort.includes(:location).where("start > ?", Date.today)
        @user = current_instructor
    end

    def create
        pw = SecureRandom.hex(8)
        stu = Student.new( user_params )
        stu.password = pw
        addDefaultValues(stu)
        if stu.valid?
            saveStudent(stu, pw)
            redirect_to "/instructors/#{session[:instructor_id]}/admin"
        else
            flash[:errors] = stu.errors.full_messages
            redirect_to "/students/new"
        end
    end

    def csv_create
        puts params[:csv_data]
        hashed = objectifyData(params[:csv_data])
        puts hashed
        mass_create_users(hashed)

        redirect_to "/students/new"
    end

    def edit
        if current_instructor
            if current_instructor.admin
                @admin = true
            else
                @admin = false
            end
        end
        @student = Student.find(params[:id])
        if current_instructor != nil
            @user = current_instructor
        end

    end

    def update_picture
        user = Student.find(params[:id])
        user = Student.update(user.id, user_params)
        redirect_to  "/students/#{params[:id]}/edit"
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

    private

    def user_params
        params.require(:user).permit(:name, :email, :cohort_id, :website, :linkedin, :about, :age, :avatar)
    end



    def objectifyData csv_data
        csv = CSV.parse(csv_data, :headers => true)
        # flash[:errors] = [];
        # row_num = 1;
        result = []
        csv.each do |row|
            hashed = row.to_hash
            puts hashed["cohort"]
            hashed["cohort_id"] = Cohort.find_by(start: hashed["cohort"]).id
            puts hashed["cohort"]
            result << hashed
        end
        return result
    end

    def mass_create_users hashed
        row_num = 2
        flash[:errors] = []
        puts hashed
        hashed.each do |entry|
            params[:user] = entry
            stu = Student.new( user_params )
            pw = SecureRandom.hex(8)
            stu.password = pw
            addDefaultValues(stu)
            puts entry
            if stu.valid?
                saveStudent(stu, pw)
            else
                msg = "Student on row #{row_num} was not added."
                stu.errors.full_messages.each { |mes| msg << " " + mes }
                flash[:errors] << msg
            end
            row_num += 1
        end
    end

    def addDefaultValues stu
        stu.active = true
        stu.happy = true
        stu.help = false
    end
    # finalizes user creation: saves/creates, emails user, and auto-joins first two stacks
    def saveStudent stu, pw
        stu.save
        email = NewUser.NewStudent(stu, pw).deliver_later
        joinFirstTwoStacks(stu)

    end

    # creates two new instances for the first two stacks (only used during user creation)
    def joinFirstTwoStacks student
        start_date = student.cohort.start
        stack_webfund = Stack.find_by(start_date: start_date, language_id: 1)
        stack_python = Stack.find_by(start_date: start_date + 1.month, language_id: 2)
        StackStudent.create(student: student, stack: stack_webfund, order: 1)
        StackStudent.create(student: student, stack: stack_python, order: 2)
    end

  end
