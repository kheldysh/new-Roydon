require 'spec_helper'

describe Product do

  before :each do
  end

  it "should create a new Product given valid attributes" do
    created = FactoryGirl.build(:product)
    created.should be_valid
  end

  it "should be empty" do
    all_products = Product.all
    all_products.should be_empty
  end

  it "should not accept zero length name" do
    no_name_product = FactoryGirl.build(:product, :name => '')
    no_name_product.should_not be_valid
  end

  it "should have a name" do
    no_name_product = Product.new
    no_name_product.should_not be_valid
  end

  it "should not have negative price" do
    negative_price_product = FactoryGirl.build(:product, :price => -5.5)
    negative_price_product.should_not be_valid
  end


  it "should have no categories" do
    no_categories_product = FactoryGirl.build(:product)
    no_categories_product.categories.should be_empty
  end

  it "should normalize filename" do
    Product.any_instance.stub(:save_attached_files => true)
    Paperclip::Attachment.any_instance.stub(:post_process => true)

    FactoryGirl.create(:product_with_image).image_file_name.should eql("test_image_1.jpg")
  end

end
