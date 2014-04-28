class SessionController < ApplicationController
  # protect_from_forgery with: :null_session

  # skip_before_action :verify_authenticity_token

  def new
    # @messages = flash.inspect
    # @messages = flash.map {| key, value| "#{key.capitalize}: #{value}"}.join(";")
    # render text: "Display the log in form."
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    # binding.pry
    if params[:user][:password].blank?
      #password reset flow
      PasswordResetter.new(flash).handle_reset_request(user_params)
      # render text: "password reset", status: :unprocessable_entity

    else
      #authenticate password flow
      # return if log_user_in( UserAuthenticator.new(session,flash).authenticate_user(user_params) )
      user = User.authenticate(params[:user][:email], params[:user][:password])
      if user
        # successful login
        render json: user, status: 201
      else
        # fail
        render text: "Oh nooooooo, silly rabbit we are out of TWIX!", status: 401
      end
    end
    # (redirect_to root_url and return) if flash.empty?
    # render :new

  end

  def destroy
    log_user_out
    # render text: "Log the user out."
    # redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end