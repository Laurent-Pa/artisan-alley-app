
class OrdersController < ApplicationController
  def index
    @orders = Order.all
    # @products = product_id(@products)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:ordered_quantity, :product_id, :user_id, :total_price)
  end

end
