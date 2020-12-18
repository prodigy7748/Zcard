module CartsHelper
  def current_cart
    @_cart9527 ||= Cart.from_hash(session[:cart1111])
  end
end