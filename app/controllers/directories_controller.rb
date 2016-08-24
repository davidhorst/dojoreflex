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
    @user = Student.where(active:false)
    render 'index.html.erb'
  end

  def blackbelts
    @students = Student.joins(:stack_students).select('students.*, SUM(CASE WHEN stack_students.blackbelt=true then 1 else 0 end) as blackbelts').group('students.id')
    render 'index.html.erb'
  end


  def show
    session[:return_to] ||= request.referer
    languages = []
    @user = Student.find(params[:id])
    @stacks = Student.find(params[:id]).stacks
    @stacks.each do |stack|
      languages.append(stack.language.name)
    end
    @languages = languages.to_sentence
    @belts = StackStudent.where(student:params[:id])
    if current_instructor != nil
        @user = current_instructor
    else
        @user = current_student
    end
  end


  def student
  end



end
