class Shop::Option
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :values, :type => Array

  validates :name, :length => {:minimum => 3}
  validates :values, :length => {:minimum => 1}
end