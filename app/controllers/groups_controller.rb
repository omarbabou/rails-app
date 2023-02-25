class GroupsController < ApplicationController
  
  def index
    @groups = current_user.groups.all.order(created_at: :desc)
  end

  def show; end
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      flash[:success] = 'Your transaction was created successfully'
      # render :show, status: :created, location: @group
      redirect_to groups_path, notice: "Added Succefully!"
    else
      flash.now[:error] = 'Post not yet saved, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end