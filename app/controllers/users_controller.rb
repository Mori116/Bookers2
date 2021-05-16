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
  if @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
  else
    @users = User.all
    render :edit
  end
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
