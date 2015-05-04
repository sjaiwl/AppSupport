class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_resource
    type = params[:type]
    @resource = Resource.find_by(id: params[:resource_id])
    if @resource!=nil
      if @resource.destroy
        json_str = "{'success':1}"
        render json: json_str
      else
        json_str = "{'success':0}"
        render json: json_str
      end

    end
  end


  def get_allResource
    @resources = Resource.where('user_id=?', params[:doctor_id]).order(updated_at: :desc)
  end

  def get_patientResource
    index = params[:index]
    if index == '0'
      @resources = Resource.where('user_id = ? AND suffer_id=?',params[:doctor_id],params[:suffer_id]).limit(5).order(updated_at: :desc)
    else
      @resources = Resource.where('user_id = ? AND suffer_id=?AND id<?',params[:doctor_id],params[:suffer_id],index).limit(5).order(updated_at: :desc)
    end
  end

  def new_resource
    @resource = Resource.new(user_id: params[:doctor_id], suffer_id: params[:suffer_id], resource_type: params[:resource_type],
                             resource_size: params[:resource_size], resource_category: params[:resource_category], resource_description: params[:resource_description])
    @resource.update_attributes(:resource_url => params[:resource_url],:resource_thumbnailUrl => params[:resource_thumbnailUrl])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:resource).permit(:user_id, :suffer_id, :resource_type, :resource_url, :resource_size, :resource_category)
  end
end
