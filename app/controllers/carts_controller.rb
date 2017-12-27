class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
  end

  def checkout 
    cart = current_user.current_cart
    current_user.current_cart.checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(cart)
  end
end
