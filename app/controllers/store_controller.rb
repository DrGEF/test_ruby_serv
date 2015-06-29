class StoreController < ApplicationController
  skip_before_action :authorize
	include CurrentCart
	before_action :set_cart

  def index
  	@products = Product.order(:updated_at)
  	@count = increment
  end

  def increment
  	session[:counter] ||= 0
  	session[:counter] += 1  	
  end
  
end