class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    user = User.find(params["id"])
    render json: user
  end

  def create
    user = User.find_by(first_name: params[:first_name], last_initial: params[:last_initial])
    if params[:password] != params[:password_confirmation]
      pw_err = "Passwords do not match!"
      render json: pw_err
    elsif user.present?
      user_error = "Username already exists"
      render json: user_error
    else
      user = User.new(first_name: params["first_name"], last_initial: params["last_initial"], password: params["password"])
      user.save
      token = JWT.encode({user_id: user.id}, 'my$ecretK3y', 'HS256')
      render json: {
        user: {
          first_name: user.first_name,
          last_initial: user.last_initial,
          id: user.id
        },
        token: token
      }
    end
  end

  def update
    user = User.find(id: params["id"])
    user.update(user_params)
    render json: user    
  end  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_initial, :password)    
  end

end