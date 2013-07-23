class VipUsersController < ApplicationController
  before_action :set_vip_user, only: [:show, :edit, :update, :destroy]

  # GET /vip_users
  # GET /vip_users.json
  def index
    @q = VipUser.search(params[:q])
    @vip_users = @q.result
    @vip_users = @vip_users.page(params[:page])
    
    respond_to do |format|
      format.html
      format.xls { send_data(@vip_users.to_xls) }
    end    
  end

  # GET /vip_users/1
  # GET /vip_users/1.json
  def show
  end

  # GET /vip_users/new
  def new
    @vip_user = VipUser.new
  end

  # GET /vip_users/1/edit
  def edit
  end

  # POST /vip_users
  # POST /vip_users.json
  def create
    @vip_user = current_user.vip_users.new(vip_user_params)

    respond_to do |format|
      if @vip_user.save
        format.html { redirect_to @vip_user, notice: 'Vip user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vip_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @vip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vip_users/1
  # PATCH/PUT /vip_users/1.json
  def update
    respond_to do |format|
      if @vip_user.update(vip_user_params)
        format.html { redirect_to @vip_user, notice: 'Vip user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_users/1
  # DELETE /vip_users/1.json
  def destroy
    @vip_user.destroy
    respond_to do |format|
      format.html { redirect_to vip_users_url }
      format.json { head :no_content }
    end
  end
  
  def freeze
    @vip_user = VipUser.find(params[:id])
    @vip_user.freeze!
    redirect_to :back, notice:'成功冻结'
  end
  
  def normal
    @vip_user = VipUser.find(params[:id])
    @vip_user.normal!
    redirect_to :back, notice:'成功解冻'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vip_user
      @vip_user = VipUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vip_user_params
      params[:vip_user].permit!
    end
end
