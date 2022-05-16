class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      @current_user = @user
      render json: @user.as_json(only: %i[email authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy; end
end
