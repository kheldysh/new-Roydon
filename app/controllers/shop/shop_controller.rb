class Shop::ShopController < ApplicationController
  
  def home
    @top_categories = Category.top_categories
    @top_category = Category.find_by_formatted_name params[:top_category] unless params[:top_category].nil?
    @categories = @top_category.children unless @top_category.nil?
    @category = Category.find_by_formatted_name params[:category] unless params[:category].nil?
    session[:shopping_cart] ||= ShoppingCart.new
    @shopping_cart = session[:shopping_cart]
    
    unless @category.nil?
      @products = @category.products.page(params[:page])
    else
      @products = @top_category.products.page(params[:page]) unless @top_category.nil?
    end
  end

end
