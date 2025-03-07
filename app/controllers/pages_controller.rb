class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
  def my_products
    @products = current_user.products
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window_html: render_to_string(partial: "products/info_window", locals: { product: product }),
        marker_html: render_to_string(partial: "products/marker")
      }
    end
  end
  def my_profile
    @user = current_user
  end

end
