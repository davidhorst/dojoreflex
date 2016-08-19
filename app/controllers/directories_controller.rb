class DirectoriesController < ApplicationController

  def index
    @students = Student.all
  end

  def allstudents
    @students = Student.all
  end

  def graduates
    @students = Student.where(active:false)
    render 'index.html.erb'
  end

  def blackbelts
    @students = Student.joins(:stack_students).select('students.*, SUM(CASE WHEN stack_students.blackbelt=true then 1 else 0 end) as blackbelts').group('students.id')
    render 'index.html.erb'
  end


  def show
    @student = Student.find(params[:id])
    @stacks = Student.find(params[:id]).stacks
    @belts = StackStudent.where(student:params[:id])
  end


  def student
  end



end
