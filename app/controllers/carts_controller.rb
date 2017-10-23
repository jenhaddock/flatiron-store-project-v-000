class CartsController < ApplicationController

  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    @cart = Cart.find_by(id: current_cart.id)
    @cart.status = "submitted"
    @cart.save
    adjust_inventory(@cart)
    old_cart = current_cart
    current_user.update(current_cart: nil)

    redirect_to cart_path(old_cart)
  end

  private

  def set_cart
    current_cart
  end

end
