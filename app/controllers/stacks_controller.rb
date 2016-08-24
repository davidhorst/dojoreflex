class StacksController < ApplicationController

  def show
    @students = Stack.find(params[:id]).stack_students
  end

end
