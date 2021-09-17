require "test_helper"

# this test file is what's called functional testing
# this tests on the category controller actions
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # we used create to hit the database table
    @category = Category.create(name: "Sports")
  end

  # tests that the index path is working well 
  test "should get index" do
    get categories_url
    assert_response :success
  end

  # tests that the new path is working well
  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    # this checks if there is a change that happened to the categories by counting them
    assert_difference('Category.count', 1) do
      # the params here are whatever is submitted by the form
      post categories_url, params: { category: { name: "Travel" } }
    end
    # it will redirect to whatever the last category that was just created
    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
