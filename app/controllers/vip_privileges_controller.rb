class VipPrivilegesController < ApplicationController
  before_action :set_vip_privilege, only: [:show, :edit, :update, :destroy]

  # GET /vip_privileges
  # GET /vip_privileges.json
  def index
    @vip_privileges = VipPrivilege.all
  end

  # GET /vip_privileges/1
  # GET /vip_privileges/1.json
  def show
  end

  # GET /vip_privileges/new
  def new
    @vip_privilege = VipPrivilege.new
  end

  # GET /vip_privileges/1/edit
  def edit
  end

  # POST /vip_privileges
  # POST /vip_privileges.json
  def create
    @vip_privilege = VipPrivilege.new(vip_privilege_params)

    respond_to do |format|
      if @vip_privilege.save
        format.html { redirect_to @vip_privilege, notice: 'Vip privilege was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vip_privilege }
      else
        format.html { render action: 'new' }
        format.json { render json: @vip_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vip_privileges/1
  # PATCH/PUT /vip_privileges/1.json
  def update
    respond_to do |format|
      if @vip_privilege.update(vip_privilege_params)
        format.html { redirect_to @vip_privilege, notice: 'Vip privilege was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vip_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_privileges/1
  # DELETE /vip_privileges/1.json
  def destroy
    @vip_privilege.destroy
    respond_to do |format|
      format.html { redirect_to vip_privileges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vip_privilege
      @vip_privilege = VipPrivilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vip_privilege_params
      params[:vip_privilege].permit!
    end
end
