require 'test_helper'

class SpecialisationCategoriesControllerTest < ActionController::TestCase
  setup do
    @specialisation_category = specialisation_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialisation_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specialisation_category" do
    assert_difference('SpecialisationCategory.count') do
      post :create, specialisation_category: { name: @specialisation_category.name, spec_cat_id: @specialisation_category.spec_cat_id }
    end

    assert_redirected_to specialisation_category_path(assigns(:specialisation_category))
  end

  test "should show specialisation_category" do
    get :show, id: @specialisation_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specialisation_category
    assert_response :success
  end

  test "should update specialisation_category" do
    put :update, id: @specialisation_category, specialisation_category: { name: @specialisation_category.name, spec_cat_id: @specialisation_category.spec_cat_id }
    assert_redirected_to specialisation_category_path(assigns(:specialisation_category))
  end

  test "should destroy specialisation_category" do
    assert_difference('SpecialisationCategory.count', -1) do
      delete :destroy, id: @specialisation_category
    end

    assert_redirected_to specialisation_categories_path
  end
end
