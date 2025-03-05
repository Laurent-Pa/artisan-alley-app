class ProductsController < ApplicationController
  # before_action :set_params[:show, :edit, :create, :destroy]
  # before_action :authenticate_user!
  before_action :check_if_artisan, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :adress, :photo)
  end

  def set_params
    @product = Product.find(params[:id])
  end

  def check_if_artisan
    unless current_user.artisan?
      flash[:alert] = "Accès réservé aux artisans."
      redirect_to root_path
    end
  end
end
