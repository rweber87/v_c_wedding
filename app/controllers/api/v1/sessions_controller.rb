class Api::V1::SessionsController < ApplicationController

	def new
	end

	def create
	end

	def destroy
		session.clear
		redirect_to '/login'
	end

end
