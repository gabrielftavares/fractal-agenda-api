class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @user.reload.authentication_token
      render json: @user.as_json(only: %i[name email authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
