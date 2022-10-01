class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
    @orders = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_22a401d16dc9c9b6af4d8175"  
    Payjp::Charge.create(
      amount: @item.money, 
      card: order_params[:token], 
      currency: 'jpy'
    )
end

end
