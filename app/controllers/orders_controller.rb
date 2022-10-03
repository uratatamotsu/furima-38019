class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
    @orders = OrderForm.new
  end

  def create
    @orders = OrderForm.new(order_params)
    if @orders.valid?
      pay_item
      @orders.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :delivery_area_id, :city, :address, :building, :tell).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.money, 
      card: order_params[:token], 
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
