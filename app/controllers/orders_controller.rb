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
    @order = Order.new()
    @order = Order.new(order_params)
    raise
    # # @order.product_id = #
    # # @order.user_id =

    # @order.save
    # redirect_to orders_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:ordered_quantity)
  end

end
