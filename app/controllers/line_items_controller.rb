class LineItemsController < ApplicationController
  def create
    current_user.set_current_cart
    new_item = current_user.current_cart.add_item(params[:item_id])
    new_item.save
    redirect_to cart_path(current_user.current_cart)
  end
end
