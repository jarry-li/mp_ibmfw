class WebsiteMenusController < ApplicationController
  before_action :set_website_menu, only: [:show, :edit, :update, :destroy]

  # GET /website_menus
  # GET /website_menus.json
  def index
    @website_menus = WebsiteMenu.all
  end

  # GET /website_menus/1
  # GET /website_menus/1.json
  def show
  end

  # GET /website_menus/new
  def new
    @website_menu = WebsiteMenu.new
  end

  # GET /website_menus/1/edit
  def edit
  end

  # POST /website_menus
  # POST /website_menus.json
  def create
    @website_menu = WebsiteMenu.new(website_menu_params)

    respond_to do |format|
      if @website_menu.save
        format.html { redirect_to @website_menu, notice: 'Website menu was successfully created.' }
        format.json { render action: 'show', status: :created, location: @website_menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @website_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /website_menus/1
  # PATCH/PUT /website_menus/1.json
  def update
    respond_to do |format|
      if @website_menu.update(website_menu_params)
        format.html { redirect_to @website_menu, notice: 'Website menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @website_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_menus/1
  # DELETE /website_menus/1.json
  def destroy
    @website_menu.destroy
    respond_to do |format|
      format.html { redirect_to website_menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website_menu
      @website_menu = WebsiteMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_menu_params
      params[:website_menu]
    end
end
