require 'test_helper'

class FoodMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_menu = food_menus(:one)
  end

  test "should get index" do
    get food_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_food_menu_url
    assert_response :success
  end

  test "should create food_menu" do
    assert_difference('FoodMenu.count') do
      post food_menus_url, params: { food_menu: { food_id: @food_menu.food_id, serve_date: @food_menu.serve_date } }
    end

    assert_redirected_to food_menu_url(FoodMenu.last)
  end

  test "should show food_menu" do
    get food_menu_url(@food_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_menu_url(@food_menu)
    assert_response :success
  end

  test "should update food_menu" do
    patch food_menu_url(@food_menu), params: { food_menu: { food_id: @food_menu.food_id, serve_date: @food_menu.serve_date } }
    assert_redirected_to food_menu_url(@food_menu)
  end

  test "should destroy food_menu" do
    assert_difference('FoodMenu.count', -1) do
      delete food_menu_url(@food_menu)
    end

    assert_redirected_to food_menus_url
  end
end
