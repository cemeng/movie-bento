require 'test_helper'

class MovieCategoriesControllerTest < ActionController::TestCase
  setup do
    @movie_category = movie_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_category" do
    assert_difference('MovieCategory.count') do
      post :create, :movie_category => @movie_category.attributes
    end

    assert_redirected_to movie_category_path(assigns(:movie_category))
  end

  test "should show movie_category" do
    get :show, :id => @movie_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @movie_category.to_param
    assert_response :success
  end

  test "should update movie_category" do
    put :update, :id => @movie_category.to_param, :movie_category => @movie_category.attributes
    assert_redirected_to movie_category_path(assigns(:movie_category))
  end

  test "should destroy movie_category" do
    assert_difference('MovieCategory.count', -1) do
      delete :destroy, :id => @movie_category.to_param
    end

    assert_redirected_to movie_categories_path
  end
end
