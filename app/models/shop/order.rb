class Shop::Order
  include Mongoid::Document
  include Mongoid::Timestamps

  PAYMENT_TYPES = ['Credit card', 'Cash']

  embeds_many :items,class_name: 'Shop::OrderItem', inverse_of: :order
  accepts_nested_attributes_for :items
  # belongs_to :user

  field :name, type: String
  field :email, type: String
  field :address, type: String
  field :country, type: String
  field :city, type: String
  field :postal_number, type: String
  field :phone, type: String
  field :message, type: String
  field :payment, type: String
  field :price, type: Money, default: Money.new(0)
  field :tax_amount, type: Money , default: Money.new(0)

  validates :name, :address, :email, presence: true
  validates :payment, inclusion: PAYMENT_TYPES

  def add_item(cart_item)
    product = cart_item.product
    items << Shop::OrderItem.new( product_id: product.id, product_name: product.name, product_price: product.price, options: cart_item.selected_option, tax: product.value_added_tax.value)
    increase_price(product.price, product.value_added_tax.substract_percentage)
  end

  def increase_price(price, tax)
    self.price += price
    self.tax_amount += price * tax
  end

  def add(cart_items)
    cart_items.each do |item|
      add_item(item)
    end
  end
end
