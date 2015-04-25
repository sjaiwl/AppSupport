require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { patient_age: @patient.patient_age, patient_gender: @patient.patient_gender, patient_height: @patient.patient_height, patient_hospitalNumber: @patient.patient_hospitalNumber, patient_idNumber: @patient.patient_idNumber, patient_name: @patient.patient_name, patient_residence: @patient.patient_residence, patient_situation: @patient.patient_situation, patient_telephone: @patient.patient_telephone, patient_url: @patient.patient_url, patient_weight: @patient.patient_weight }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { patient_age: @patient.patient_age, patient_gender: @patient.patient_gender, patient_height: @patient.patient_height, patient_hospitalNumber: @patient.patient_hospitalNumber, patient_idNumber: @patient.patient_idNumber, patient_name: @patient.patient_name, patient_residence: @patient.patient_residence, patient_situation: @patient.patient_situation, patient_telephone: @patient.patient_telephone, patient_url: @patient.patient_url, patient_weight: @patient.patient_weight }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
