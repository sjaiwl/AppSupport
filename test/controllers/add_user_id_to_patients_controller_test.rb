require 'test_helper'

class AddUserIdToPatientsControllerTest < ActionController::TestCase
  setup do
    @add_user_id_to_patient = add_user_id_to_patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_user_id_to_patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_user_id_to_patient" do
    assert_difference('AddUserIdToPatient.count') do
      post :create, add_user_id_to_patient: { user_id: @add_user_id_to_patient.user_id }
    end

    assert_redirected_to add_user_id_to_patient_path(assigns(:add_user_id_to_patient))
  end

  test "should show add_user_id_to_patient" do
    get :show, id: @add_user_id_to_patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_user_id_to_patient
    assert_response :success
  end

  test "should update add_user_id_to_patient" do
    patch :update, id: @add_user_id_to_patient, add_user_id_to_patient: { user_id: @add_user_id_to_patient.user_id }
    assert_redirected_to add_user_id_to_patient_path(assigns(:add_user_id_to_patient))
  end

  test "should destroy add_user_id_to_patient" do
    assert_difference('AddUserIdToPatient.count', -1) do
      delete :destroy, id: @add_user_id_to_patient
    end

    assert_redirected_to add_user_id_to_patients_path
  end
end
