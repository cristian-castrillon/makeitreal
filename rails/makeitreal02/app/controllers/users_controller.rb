class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecordNotFound
      # 200 :ok
      # 400 :bad_request
      # 404 :not_found
      # render :not_found
      redirect_to(users_path)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(users_path)
    else

      @errors = @user.errors.full_messages
      render "users/new"
    end
  end

  

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
