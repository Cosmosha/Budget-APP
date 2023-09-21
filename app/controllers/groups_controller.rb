class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:entities).where(author: current_user)
  end

  def new; end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:success] = 'Group was successfully created.'
      redirect_to groups_path
    else
      flash.now[:error] = 'Error! Please check the form and try again.'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
