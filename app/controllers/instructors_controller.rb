class InstructorsController < ApplicationController
  before_action :require_instructor_login, only: [ :show ]
  before_action :require_instructor_or_admin_login, only: [ :update, :update_picture, :edit ]
  before_action :require_correct_instructor, only: [ :show ]
  before_action :require_correct_instructor_or_admin, only: [ :update, :update_picture, :edit ]
  before_action :require_admin_only_login, only: [ :new, :create, :csv_create ]


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
    @chart =  Stack.where(instructor: current_instructor).where(active: true)
    if @chart
        @chart = @chart.first.assignments
    end
    @stacks = Stack.where(instructor: current_instructor).order(:start_date).where("start_date > ?", Date.today - 3.month)

  end

  def admin
    @students = Student.includes(:cohort)
    @instructors = Instructor.all
    @user = current_instructor
  end

  def create
      pw = SecureRandom.hex(8)
      ins = Instructor.new( user_params )
      ins.password = pw
      addDefaultValues(ins)
      if ins.valid?
          ins.save
          saveInstructor(ins, pw)
          redirect_to "/instructors/#{session[:instructor_id]}/admin"
      else
          flash[:errors_1] = ins.errors.full_messages
          redirect_to "/instructors/new"
      end
  end

  def csv_create
    puts params[:csv_data]
    hashed = objectifyData(params[:csv_data])
    mass_create_users(hashed)

    redirect_to "/instructors/new"
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


  def objectifyData csv_data
      csv = CSV.parse(csv_data, :headers => true)
      result = []
      csv.each do |row|
          hashed = row.to_hash
          # hashed["cohort"] = Cohort.find_by(start: hashed["cohort"]) #student only
          result << hashed
      end
      return result
  end

  def mass_create_users hashed
      row_num = 2
      flash[:errors_2] = []
      hashed.each do |entry|
          params[:user] = entry
          ins = Instructor.new( user_params )
          pw = SecureRandom.hex(8)
          ins.password = pw
          addDefaultValues(ins)
          if ins.valid?
              saveInstructor(ins, pw)
          else
              msg = "Row #{row_num} not added:"
              ins.errors.full_messages.each { |mes| msg << " " + mes }
              flash[:errors_2] << msg
          end
          row_num += 1
      end
  end

  def addDefaultValues ins
    ins.location_id = 1
  end

  # finalizes user creation: saves/creates, emails user, and auto-joins first two stacks
  def saveInstructor ins, pw
      ins.save
      email = NewUser.NewInstructor(ins, pw).deliver_later
  end
end
