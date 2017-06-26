class Api::V1::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(first_name: params[:first_name], last_initial: params[:last_initial])
    if user.present? && user.authenticate(params[:password])
      ## create a JWT token that encodes the user_id and send that back as part of the response...
      token = JWT.encode({user_id: user.id}, 'my$ecretK3y', 'HS256')
      render json: {
        user: {
          first_name: user.first_name,
          id: user.id
        },
        token: token
      }
    else
      render json: {error: 'No user or password found'}
    end
  end

  def delete
    render json: {message: 'destroy method has been hit!'}
  end
end