require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "Should not save without name" do
    @brand = Brand.new(:twitter_handle => 'test')
    assert !@brand.save, "Saved without name"
  end

  test "Should not save without twitter handle" do
    @brand = Brand.new(:name => 'test')
    assert !@brand.save, "Saved without twitter handle"
  end

  test "Should not save duplicate twitter handle" do
    @brand = brands(:one)
    @brand2 = Brand.new(:name => 'test', :twitter_handle => @brand.twitter_handle)
    assert !@brand2.save, "Saved duplicate twitter handle"
  end

  test "Should default to active" do 
    @brand = Brand.new(:name => 'test', :twitter_handle => 'test')
    if @brand.save
      assert @brand.active, "Did not default to active"
    else
      flunk('That should have worked')
    end
  end
end
