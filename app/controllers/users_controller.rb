class UsersController < ApplicationController

def index
  @users = User.all
  @user = current_user
end

def show
  @user = User.find(params[:id])
  @books = @user.books.page(params[:page]).reverse_order
  @book = Book.new
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
