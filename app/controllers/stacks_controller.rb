class StacksController < ApplicationController

  def index
    @user = current_instructor
    @stacks = Stack.all
  end

  def show
    @user = current_instructor
    @stack = Stack.find(params[:id])
    @students = Stack.find(params[:id]).stack_students
  end

end
