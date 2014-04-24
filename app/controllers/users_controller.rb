class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @users = User.all
    # render json: @users
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def create
    @users = User.new(user_params)
    if @users.save
      render json: @users#, status: :created, location: users_url(@users)
    else
      head :unproccessable_entity
    end
  end

  def update
    @users = User.find params[:id]

    if @users
      if @users.update_attributes(user_params)
        head :no_content
      else
        head :unproccessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @users = User.find params[:id]

    if @users
      if @users.destroy
        head :no_content
      else
        head :unproccessable_entity
      end
    else
      head :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end