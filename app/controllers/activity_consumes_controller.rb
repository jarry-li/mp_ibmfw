class ActivityConsumesController < ApplicationController
  before_action :set_activity_consume, only: [:show, :edit, :update, :destroy]

  # GET /activity_consumes
  # GET /activity_consumes.json
  def index
    @q = ActivityConsume.search(params[:q])
    @activity_consumes = @q.result
    @activity_consumes = @activity_consumes.page(params[:page])
  end

  # GET /activity_consumes/1
  # GET /activity_consumes/1.json
  def show
  end

  # GET /activity_consumes/new
  def new
    @activity_consume = ActivityConsume.new
  end

  # GET /activity_consumes/1/edit
  def edit
  end

  # POST /activity_consumes
  # POST /activity_consumes.json
  def create
    @activity_consume = ActivityConsume.new(activity_consume_params)

    respond_to do |format|
      if @activity_consume.save
        format.html { redirect_to @activity_consume, notice: 'Activity consume was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_consume }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_consume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_consumes/1
  # PATCH/PUT /activity_consumes/1.json
  def update
    respond_to do |format|
      if @activity_consume.update(activity_consume_params)
        format.html { redirect_to @activity_consume, notice: 'Activity consume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_consume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_consumes/1
  # DELETE /activity_consumes/1.json
  def destroy
    @activity_consume.destroy
    respond_to do |format|
      format.html { redirect_to activity_consumes_url }
      format.json { head :no_content }
    end
  end
  
  def used
    @activity_consume = ActivityConsume.find(params[:id])
    @activity_consume.used!
    redirect_to :back, notice:'活动码已经已使用'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_consume
      @activity_consume = ActivityConsume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_consume_params
      params[:activity_consume].permit!
    end
end
