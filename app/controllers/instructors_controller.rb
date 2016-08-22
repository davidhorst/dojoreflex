class InstructorsController < ApplicationController
	before_action :require_instructor_login
	before_action :require_admin, only: [ :new ]

	def edit
	end

	def new
	end

	def show
	end
end
