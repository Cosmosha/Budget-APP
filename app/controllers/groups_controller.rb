class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:entities).where(author: current_user)
  end

  def new; end

  def create
    current_user.groups.create(group_params)
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
