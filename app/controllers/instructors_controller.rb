class InstructorsController < ApplicationController
  def edit
  end

  def new
  end

  def show
      @user = current_instructor
  end
end
