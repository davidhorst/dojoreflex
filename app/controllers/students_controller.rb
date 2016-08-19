require 'json'
require 'net/http' #to make a GET request
require 'open-uri' #to fetch the data from the URL to then be parsed by JSON

class StudentsController < ApplicationController

 def new
  end

  def show
       @user = Student.find(params[:id])
  end


  def edit
      user = Student.find(params[:id])
      Student.update(user.id, user_update_params)


      if user.valid?
         redirect_to "/students/#{user.id.to_s}"
      else
          flash[:errors] = user.errors.full_messages
          redirect_to "/students/#{user.id.to_s}"
      end
  end


private
def user_update_params
  params.require(:user).permit(:name, :email, :avatar, :website, :linkedin, :about, :age)
end
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end
