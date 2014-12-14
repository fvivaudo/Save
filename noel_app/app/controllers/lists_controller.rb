class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @lists = List.where(user_id: current_user).all
  end

  def show
    @participations = @list.participations
    if params[:search]
      if @user = User.search(params[:search]).first
        @participation = @list.participations.create(user_id: @user.id)
      end
    end

  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to lists_path
    else
      render action: 'new'
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :birthday, :user_id)
  end
end
