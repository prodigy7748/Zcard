class CartsController < ApplicationController
  def add_item
    product = Product.find(params[:id])
    cart = Cart.from_hash(session[:cart1111])
    current_cart.add_item(product.id)
    session[:cart1111] = current_cart.serialize
    redirect_to pricing_path, notice: '已加入購物車！'
  end

  def show
  end

  def destroy
    session[:cart1111] = nil
    redirect_to pricing_path, notice: '購物車清除'
  end

  def checkout
    @order = Order.new
    @token = gateway.client_token.generate
  end

  private
  def gateway
    Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => ENV["7smb8bfph3rgs5jk"],
      :public_key => ENV[""],
      :private_key => ENV[""],
    )
  end


end
