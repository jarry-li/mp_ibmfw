class ActivityPropertiesController < ApplicationController
  before_action :set_activity_property, only: [:show, :edit, :update, :destroy]

  # GET /activity_properties
  # GET /activity_properties.json
  def index
    @activity_properties = ActivityProperty.all
  end

  # GET /activity_properties/1
  # GET /activity_properties/1.json
  def show
  end

  # GET /activity_properties/new
  def new
    @activity_property = ActivityProperty.new
  end

  # GET /activity_properties/1/edit
  def edit
  end

  # POST /activity_properties
  # POST /activity_properties.json
  def create
    @activity_property = ActivityProperty.new(activity_property_params)

    respond_to do |format|
      if @activity_property.save
        format.html { redirect_to @activity_property, notice: 'Activity property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_property }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_properties/1
  # PATCH/PUT /activity_properties/1.json
  def update
    respond_to do |format|
      if @activity_property.update(activity_property_params)
        format.html { redirect_to @activity_property, notice: 'Activity property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_properties/1
  # DELETE /activity_properties/1.json
  def destroy
    @activity_property.destroy
    respond_to do |format|
      format.html { redirect_to activity_properties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_property
      @activity_property = ActivityProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_property_params
      params[:activity_property]
    end
end
