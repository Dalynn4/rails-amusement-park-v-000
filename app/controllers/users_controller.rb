class UsersController < ApplicationController

  def show
    if logged_in?
    @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def update
  end

  def edit
  end

    private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :height, :happiness, :tickets, :admin)
    end
end
