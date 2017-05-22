class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :authorize, except: [:new, :create]

	def show
	end

	def new
		@user = User.new
	end	

	def edit
	end

	def create
		byebug
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/welcome'
		else
			flash.now[:danger] = 'Invalid username/password combination.'
			redirect_to '/login'
		end
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def user_params
		params.require(:user).permit(:first_name, :last_initial, :password_digest)
	end

end
