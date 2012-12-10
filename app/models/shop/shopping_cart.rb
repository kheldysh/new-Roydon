class Shop::ShoppingCart
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  has_many :items, class_name: 'Shop::CartItem', inverse_of: :cart

  delegate :empty?, :to => :items

  accepts_nested_attributes_for :items

  def empty
    self.items.clear
  end

  def size
    self.items.inject(0) do|result, item|
      result += item.quantity
    end
  end

  def add(product, options = {})
    options = {} if options.nil?
    product = Shop::Product.find(product) unless product.class == Shop::Product
    new_options = options.inject([]) {|x,y| x << y.join(': ')} # Option array in the form ['Option name': 'Option value', ...]
    existing_item = self.items.includes(:product).to_a.find { |x| x.product == product &&  x.selected_option == new_options}
    if existing_item
      existing_item.inc(:quantity, 1)
    else
      self.items << Shop::CartItem.new(product: product, selected_option: new_options, single_price: product.price)
    end
  end

  def remove(cart_item_id)
    items.find(cart_item_id).destroy
  end

  def price
    price = Money.new(0)
    self.items.each do |item|
      price += item.price
    end
    price
  end

  def latest_items
    self.items.includes(:product).order_by(:updated_at.desc).limit(5)
  end
end
