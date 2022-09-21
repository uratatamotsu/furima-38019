class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @items = Item.order("created_at DESC")
    @purchases = Purchase.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
    @purchases = Purchase.all
  end

  private


  def item_params
    params.require(:item).permit(:exhibits_name, :exhibits_text, :category_id, :situation_id, :shipping_cost_id, :delivery_area_id, :shipping_days_id, :money, :image).merge(user_id: current_user.id)
  end

end
