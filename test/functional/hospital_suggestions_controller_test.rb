require 'test_helper'

class HospitalSuggestionsControllerTest < ActionController::TestCase
  setup do
    @hospital_suggestion = hospital_suggestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospital_suggestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital_suggestion" do
    assert_difference('HospitalSuggestion.count') do
      post :create, hospital_suggestion: { hospital_id: @hospital_suggestion.hospital_id, user_id: @hospital_suggestion.user_id }
    end

    assert_redirected_to hospital_suggestion_path(assigns(:hospital_suggestion))
  end

  test "should show hospital_suggestion" do
    get :show, id: @hospital_suggestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hospital_suggestion
    assert_response :success
  end

  test "should update hospital_suggestion" do
    put :update, id: @hospital_suggestion, hospital_suggestion: { hospital_id: @hospital_suggestion.hospital_id, user_id: @hospital_suggestion.user_id }
    assert_redirected_to hospital_suggestion_path(assigns(:hospital_suggestion))
  end

  test "should destroy hospital_suggestion" do
    assert_difference('HospitalSuggestion.count', -1) do
      delete :destroy, id: @hospital_suggestion
    end

    assert_redirected_to hospital_suggestions_path
  end
end
