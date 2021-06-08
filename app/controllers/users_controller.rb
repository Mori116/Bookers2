class UsersController < ApplicationController

def index
  @users = User.all
  @user = current_user
  @book = Book.new
end

def show
  @user = User.find(params[:id])
  @currentUserEntry = Entry.where(user_id: current_user.id)
  @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

    @book = Book.new
    @books = @user.books
    @today_book =  @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
    # 投稿数

end

def edit
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
  end
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
