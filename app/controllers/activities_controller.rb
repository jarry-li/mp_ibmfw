class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = current_user.activities.includes([:wx_mp_user,:activity_type]).where("activities.status >= -1").order("activity_types.sort",:created_at)
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = current_user.activities.new
  end

  # GET /activities/1/edit
  def edit
    set_activity
    logger.info "setting...#{@activity.activity_property.try(:id)}...#{@activity.activity_notices.size}...#{@activity.activity_prizes.size}"
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = current_user.activities.new(activity_params)
    @activity.supplier_id = current_user.id
    #@activity.status = Activity::SETTING if @activity.activity_type.is_show?

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  def stop
    set_activity
    if @activity.stop!
      redirect_to :back, notice: '操作成功'
    else
      redirect_to :back, notice: '操作失败'
    end
  end

  def delete
    set_activity
    if @activity.delete!
      redirect_to :back, notice: '操作成功'
    else
      redirect_to :back, notice: '操作失败'
    end
  end

  def unset_delete
    set_activity
    if @activity.unset_delete!
      redirect_to :back, notice: '操作成功'
    else
      redirect_to :back, notice: '操作失败'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params[:activity].permit!
    end
end
