require 'spec_helper'

describe Shop::Product do

  it "should create a new Shop::Product given valid attributes" do
    created = FactoryGirl.build(:product)
    created.should be_valid
  end

  it "should be empty" do
    all_products = Shop::Product.all
    all_products.should be_empty
  end

  it "should not accept zero length name" do
    no_name_product = FactoryGirl.build(:product, :name => '')
    no_name_product.should_not be_valid
  end

  it "should have a name" do
    no_name_product = Shop::Product.new
    no_name_product.should_not be_valid
  end

  it "should not have negative price" do
    negative_price_product = FactoryGirl.build(:product, price: Money.new(-550))
    negative_price_product.should_not be_valid
  end


  it "should have no categories" do
    no_categories_product = FactoryGirl.build(:product)
    no_categories_product.categories.should be_empty
  end

  it "should normalize filename" do
    Shop::Product.any_instance.stub(:save_attached_files => true)
    Paperclip::Attachment.any_instance.stub(:post_process => true)
    FactoryGirl.create(:product_with_image).image_file_name.should eql("test_image_1.jpg")
  end

  it "should create prodcut with options" do
    prod = FactoryGirl.create(:product_with_options)
    prod.options.should_not be_empty
  end

  it "should have correct options" do
    prod = FactoryGirl.create(:product_with_options)
    prod.options.should_not be_empty
    prod.options.first.values.should include('Red')
  end

  it "should return unmodified price when no discount" do
    subject.discount.should_not be_present
    subject.discounted_price.should eq subject.price
  end

  describe "discounted products" do
    subject { FactoryGirl.build(:product) }
    it "should return discounted price" do
      discount = FactoryGirl.create(:discount, value: 10)
      subject.discount = discount
      subject.discounted_price.should eq(subject.price * 0.9)
    end
  end

end
