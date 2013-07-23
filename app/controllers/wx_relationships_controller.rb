class WxRelationshipsController < ApplicationController
  before_action :set_wx_relationship, only: [:show, :edit, :update, :destroy]

  # GET /wx_relationships
  # GET /wx_relationships.json
  def index
    @wx_relationships = WxRelationship.all
  end

  # GET /wx_relationships/1
  # GET /wx_relationships/1.json
  def show
  end

  # GET /wx_relationships/new
  def new
    @wx_relationship = WxRelationship.new
  end

  # GET /wx_relationships/1/edit
  def edit
  end

  # POST /wx_relationships
  # POST /wx_relationships.json
  def create
    @wx_relationship = WxRelationship.new(wx_relationship_params)

    respond_to do |format|
      if @wx_relationship.save
        format.html { redirect_to @wx_relationship, notice: 'Wx relationship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wx_relationship }
      else
        format.html { render action: 'new' }
        format.json { render json: @wx_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wx_relationships/1
  # PATCH/PUT /wx_relationships/1.json
  def update
    respond_to do |format|
      if @wx_relationship.update(wx_relationship_params)
        format.html { redirect_to @wx_relationship, notice: 'Wx relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wx_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wx_relationships/1
  # DELETE /wx_relationships/1.json
  def destroy
    @wx_relationship.destroy
    respond_to do |format|
      format.html { redirect_to wx_relationships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wx_relationship
      @wx_relationship = WxRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wx_relationship_params
      params[:wx_relationship]
    end
end
