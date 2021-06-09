class GroupsController < ApplicationController

  def create_group
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to groups_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :introduction)
  end
end
