class VipCardsController < ApplicationController
  before_action :set_vip_card, only: [:show, :edit, :update, :destroy]

  # GET /vip_cards
  # GET /vip_cards.json
  def index
    @vip_cards = VipCard.all
  end

  # GET /vip_cards/1
  # GET /vip_cards/1.json
  def show
  end

  # GET /vip_cards/new
  def new
    @vip_card = VipCard.new
  end

  # GET /vip_cards/1/edit
  def edit
  end

  # POST /vip_cards
  # POST /vip_cards.json
  def create
    @vip_card = VipCard.new(vip_card_params)

    respond_to do |format|
      if @vip_card.save
        format.html { redirect_to @vip_card, notice: 'Vip card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vip_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @vip_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vip_cards/1
  # PATCH/PUT /vip_cards/1.json
  def update
    respond_to do |format|
      if @vip_card.update(vip_card_params)
        format.html { redirect_to @vip_card, notice: 'Vip card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vip_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_cards/1
  # DELETE /vip_cards/1.json
  def destroy
    @vip_card.destroy
    respond_to do |format|
      format.html { redirect_to vip_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vip_card
      @vip_card = VipCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vip_card_params
      params[:vip_card].permit!
    end
end
