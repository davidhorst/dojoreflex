class SessionsController < ApplicationController
	# reroutes to /login when root url is given
	def index
		redirect_to "/login"
	end

	# GET: login page
	def new

	end
end
