class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def index
    @groups = Group.all
    @user = current_user
    @book = Book.new
  end

  def show
    @group = Group.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def join
    @group = Group.find(params[:group_id])
  end

  def join_check
    @group = Group.find(params[:group_id])
    if @group && @group.authenticate(params[:group][:password])
      @group.users << current_user
      redirect_to  group_path(@group)
    else
      flash[:alert] = "パスワードが違います。"
      render 'join'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end
  # グループから抜ける際のアクション

  private
  def group_params
    params.require(:group).permit(:name, :image, :introduction, :password, :password_confirmation)
  end
end
