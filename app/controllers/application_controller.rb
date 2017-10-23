class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_cart
  helper_method :adjust_inventory

  private

  def current_cart
    if current_user
      User.find(current_user.id).current_cart
    end
  end

  def adjust_inventory(cart)
    if !cart.nil?
      @cart = Cart.find_by(id: cart.id)
      @cart.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end
  end

end
