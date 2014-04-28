class RegistrationController < ApplicationController
  protect_from_forgery with: :null_session

  def new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      log_user_in(@user)
      # head :ok
      render json: @user
    else
      head :unprocessable_entity
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end