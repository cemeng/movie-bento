require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:one)
    @update = {
      :title => 'New Test',
      :overview => 'Test',
      :image => '/images/14-blades.jpg',
      :duration => 160
      
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, :movie => @update
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, :id => @movie.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @movie.to_param
    assert_response :success
  end

  test "should update movie" do
    put :update, :id => @movie.to_param, :movie => @update
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, :id => @movie.to_param
    end

    assert_redirected_to movies_path
  end
end
