class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #获取病人信息
  def get_allPatient
    index = params[:index]
    if index == '0'
      @patients = Patient.where('user_id=?', params[:doctor_id]).limit(10).order(updated_at: :desc)
      render json: @patients.as_json
    else
      @patients = Patient.where('user_id=?AND id<?', params[:doctor_id], index).limit(5).order(updated_at: :desc)
      render json: @patients.as_json
    end
  end

  #获取搜索病人信息
  def get_searchPatient
    @patients = Patient.where('user_id=?', params[:doctor_id]).order(updated_at: :desc)
    if @patients!=nil
      render json: @patients.as_json
    else
      render json: @patients.errors
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:patient_hospitalNumber, :patient_name, :patient_gender, :patient_age, :patient_height, :patient_weight, :patient_telephone, :patient_idNumber, :patient_residence, :patient_situation, :patient_url, :user_id)
  end
end
