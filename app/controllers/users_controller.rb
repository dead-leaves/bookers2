class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
