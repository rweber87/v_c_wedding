class SessionsController < ApplicationController

	def new
	end

	def create
		byebug
		
	end

	def destroy
		session.clear
		redirect_to '/login'
	end

end
