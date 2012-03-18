require 'spec_helper'

describe ShowsHelper do

  it "should return nil on empty collection" do
    display_show_rows({}).should be nil
  end

  it "should return correct year for input" do
    display_show_year(2012).should be 2012
  end

  it "should return year range, if month >= 6" do
    self.time = Date.new(2012,6,1)
    display_show_year.should == '2012 - 2013'
  end

  it "should return correctly the current year" do
    self.time = Date.new(Date.today.year, 1, 1)
    display_show_year.should be Date.today.year
  end
end
