require "test_helper"

# this test file is what's called functional testing
# this tests on the category controller actions
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # we used create to hit the database table
    @category = Category.create(name: "Sports")
    # we have to create an admin user here to pass the test case that we've done during the creation of a category
    # note that the password has to be the same as the password provided in the test_helper sign_in_as helper method
    @admin_user = User.create(username: "marc", email: "marc@gmail.com", password: "password", admin: true)
  end

  # tests that the index path is working well 
  test "should get index" do
    get categories_url
    assert_response :success
  end

  # tests that the new path is working well
  test "should get new" do
    # the user has to be signed in as an admin to be able to access the routes for the new and create categories methods 
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    # i have to write the code for signing user in here too because after the prvious test ends the data will be useless
    sign_in_as(@admin_user)
    # this checks if there is a change that happened to the categories by counting them
    assert_difference('Category.count', 1) do
      # the params here are whatever is submitted by the form
      post categories_url, params: { category: { name: "Travel" } }
    end
    # it will redirect to whatever the last category that was just created
    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "Travel" } }
    end
    assert_redirected_to categories_url
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
