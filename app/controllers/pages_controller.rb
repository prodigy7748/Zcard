class PagesController < ApplicationController
  def pricing
    @products = Product.all.order(price: :ASC)
  end
end
