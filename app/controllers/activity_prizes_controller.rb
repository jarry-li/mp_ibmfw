class ActivityPrizesController < ApplicationController
  before_action :set_activity_prize, only: [:show, :edit, :update, :destroy]

  # GET /activity_prizes
  # GET /activity_prizes.json
  def index
    @activity_prizes = ActivityPrize.all
  end

  # GET /activity_prizes/1
  # GET /activity_prizes/1.json
  def show
  end

  # GET /activity_prizes/new
  def new
    @activity_prize = ActivityPrize.new
  end

  # GET /activity_prizes/1/edit
  def edit
  end

  # POST /activity_prizes
  # POST /activity_prizes.json
  def create
    @activity_prize = ActivityPrize.new(activity_prize_params)

    respond_to do |format|
      if @activity_prize.save
        format.html { redirect_to @activity_prize, notice: 'Activity prize was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_prize }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_prize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_prizes/1
  # PATCH/PUT /activity_prizes/1.json
  def update
    respond_to do |format|
      if @activity_prize.update(activity_prize_params)
        format.html { redirect_to @activity_prize, notice: 'Activity prize was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_prize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_prizes/1
  # DELETE /activity_prizes/1.json
  def destroy
    @activity_prize.destroy
    respond_to do |format|
      format.html { redirect_to activity_prizes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_prize
      @activity_prize = ActivityPrize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_prize_params
      params[:activity_prize]
    end
end
