class StoreController < ApplicationController
  def index
    @cart = current_user.current_cart if current_user != nil && current_user.current_cart != nil
    @categories = Category.all
    @items = Item.all
  end
end
