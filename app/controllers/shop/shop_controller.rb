class Shop::ShopController < ApplicationController
  layout 'shop'
  before_filter :set_cart
  before_filter :load_top_menu
  before_filter :load_side_menu

  def index
  end

  def add_to_cart
    @shopping_cart.add(params[:product], params[:options])

    success_msg = I18n.t 'shop.cart.add.success'
    respond_to do |format|
      flash[:notice] = success_msg
      format.html { redirect_to(request.referer ||shop_path) }
      format.js { render :json => { message: success_msg } }
    end
  end

  private

    def set_cart
      begin
        @shopping_cart = (session[:shopping_cart_id].nil? && ShoppingCart.create) || ShoppingCart.find(session[:shopping_cart_id])
      rescue Mongoid::Errors::DocumentNotFound
        @shopping_cart = ShoppingCart.create
      end
      session[:shopping_cart_id] = @shopping_cart.id.to_s
    end

    def load_top_menu
      @top_categories = Category.top_categories
    end

    def load_side_menu
      unless params[:category].nil?
        @category = Category.find_by_formatted_name params[:category]
        @top_category = Category.find_by_formatted_name params[:category].split('-').first
        @categories = @top_category.children unless @top_category.nil?
      end
    end

end
