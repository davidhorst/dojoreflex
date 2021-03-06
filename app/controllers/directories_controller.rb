class DirectoriesController < ApplicationController

  def index
    if session[:return_to]
      session[:return_to] = nil
    end

    @students = Student.all

    if current_instructor != nil
        @user = current_instructor
    else
        @user = current_student
    end

  end

  def allstudents
    @students = Student.all
  end

  def graduates
      @students = Student.all
      if current_instructor != nil
          @user = current_instructor
      else
          @user = current_student
      end
    render 'index.html.erb'
  end

  def blackbelts
    @students = Student.joins(:stack_students).select('students.*, SUM(CASE WHEN stack_students.blackbelt=true then 1 else 0 end) as blackbelts').group('students.id')
    render 'index.html.erb'
  end


  def show
    session[:return_to] ||= request.referer
    languages = []
    belts = []
    @person = Student.find(params[:id])
    @stacks = Student.find(params[:id]).stacks
    @stacks.each do |stack|
      languages.append(stack.language.name)
    end
    @languages = languages.to_sentence
    @belts = StackStudent.where(student_id: params[:id])
    @belts.each do |belt|
      if belt.belt != "" and belt.belt != nil
        belts.append(belt.stack.language.name + " " + belt.belt + " belt")
      end
    end
    @belts = belts.to_sentence
    if current_instructor != nil
        @user = current_instructor
    else
        @user = current_student
    end
  end


  def student
  end



end
