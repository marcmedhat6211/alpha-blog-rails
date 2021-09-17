require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and creating category" do
    # the first thing we go the the new form route
    get "/categories/new"
    # making sure that the response is success
    assert_response :success
    # making sure that a category is created by checking the category count
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports" } }
      # making sure that a redirect after the category creation has happened
      assert_response :redirect
    end
    # after the redirect happens we want to follow that redirect and sees where it takes us
    follow_redirect!
    # making sure that the redirect is made successfully
    assert_response :success
    # in the category create action after the submission is done it redirects the app to the category show page
    # which for sure will have the category's name shown in it
    # so to a way to check that we're redirected correctly is to check whether the name of that category is shown in the path where we got redirected
    # so what this line is saying --> look for 'Sports' in the html body
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    # the first thing we go the the new form route
    get "/categories/new"
    # making sure that the response is success
    assert_response :success
    # making sure that a category is created by checking the category count
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    # first we make sure that word errors which is in the errors partial is there in the html body
    assert_match "errors", response.body
    # assert_select makes sure that this element exists in the page
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
