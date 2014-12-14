class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @link = @item.lists =
    if @item.save
      redirect_to items_path
    else
      render action: 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
