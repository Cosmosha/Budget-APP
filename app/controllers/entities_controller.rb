class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.includes(:entities).find_by_id(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new({ author_id: current_user.id, **entity_params })
    if @entity.save
      flash[:success] = 'Transaction was successfully added.'
      redirect_to group_entities_path(@group)
    else
      render :new
      flash[:error] = 'Error! Please check the form and try again.'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
