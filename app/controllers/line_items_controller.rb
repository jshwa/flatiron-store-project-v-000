class LineItemsController < ApplicationController
  def create
    if user_signed_in?
      current_user.set_current_cart
      new_item = current_user.current_cart.add_item(params[:item_id])
      new_item.save
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to new_user_registration_path
    end
  end
end
