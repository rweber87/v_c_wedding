class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(params[:user])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/welcome'
		else
			flash.now[:danger] = 'Invalid username/password combination.'
			redirect_to '/login'
		end
	end

	def destroy
		session.clear
		redirect_to '/welcome'
	end

end
