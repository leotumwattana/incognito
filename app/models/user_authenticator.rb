
class UserAuthenticator

  AUTH_FAILED = "Unable to log you into the system, please try again"

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def authenticate_user(params)
    #email and password

    puts "running authenticate_user with #{params}"
    puts (User.authenticate(params[:email], params[:password])).inspect

    @flash.now[:alert] = AUTH_FAILED unless @user = User.authenticate(params[:email], params[:password])
    @user

  end


end