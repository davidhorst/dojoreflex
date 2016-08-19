class DirectoriesController < ApplicationController

  def index
    @blackbelts = StackStudent.where(blackbelt=true)
  end

  def show
  end


  def student
  end



end
