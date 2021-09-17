require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # this method runs before every test
  # used to avoid the duplicate code
  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category should be valid" do
    @category = Category.new(name: "Sports")
    # available assertions can be found in the link below
    # https://guides.rubyonrails.org/testing.html#available-assertions
    assert @category.valid?
  end

  test "name should be present" do
    # here we're just setting the category value that was set in the setup method
    @category.name = " "
    # unlike the assert, assert_not will test for false
    assert_not @category.valid?
  end

  test "name should be unique" do
    # to test if the category is unique or not, we have to have another category with the same name in the database (test database)
    # so we save the category made in the setup method, then we create a new one with the same name
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not(@category.valid?, "Category name should not be longer than 25 characters")
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not(@category.valid?, "Category name should not be shorter than 3 characters")
  end

end