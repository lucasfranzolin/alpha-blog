require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password")
  end

  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      # post_via_redirect categories_path, category: {name: "sports"}
      # if using Rails 5 use below 2 lines instead of line above (without the comment tag of course):
      post categories_path, params: { category: { name: "sports" } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category results in failure" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title' # look at views/shared/_errors.html.erb
    assert_select 'div.panel-body'
  end

end