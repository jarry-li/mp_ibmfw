class ActivityNoticesController < ApplicationController
  before_action :set_activity_notice, only: [:show, :edit, :update, :destroy]

  # GET /activity_notices
  # GET /activity_notices.json
  def index
    @activity_notices = ActivityNotice.all
  end

  # GET /activity_notices/1
  # GET /activity_notices/1.json
  def show
  end

  # GET /activity_notices/new
  def new
    @activity_notice = ActivityNotice.new
  end

  # GET /activity_notices/1/edit
  def edit
  end

  # POST /activity_notices
  # POST /activity_notices.json
  def create
    @activity_notice = ActivityNotice.new(activity_notice_params)

    respond_to do |format|
      if @activity_notice.save
        format.html { redirect_to @activity_notice, notice: 'Activity notice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_notice }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_notices/1
  # PATCH/PUT /activity_notices/1.json
  def update
    respond_to do |format|
      if @activity_notice.update(activity_notice_params)
        format.html { redirect_to @activity_notice, notice: 'Activity notice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_notices/1
  # DELETE /activity_notices/1.json
  def destroy
    @activity_notice.destroy
    respond_to do |format|
      format.html { redirect_to activity_notices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_notice
      @activity_notice = ActivityNotice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_notice_params
      params[:activity_notice]
    end
end
