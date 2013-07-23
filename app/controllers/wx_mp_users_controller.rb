class WxMpUsersController < ApplicationController
  before_action :set_wx_mp_user, only: [:show, :edit, :update, :destroy]

  # GET /wx_mp_users
  # GET /wx_mp_users.json
  def index
    @wx_mp_users = current_user.wx_mp_users
  end

  # GET /wx_mp_users/1
  # GET /wx_mp_users/1.json
  def show
  end

  # GET /wx_mp_users/new
  def new
    @wx_mp_user = current_user.wx_mp_users.new
  end

  # GET /wx_mp_users/1/edit
  def edit
  end

  # POST /wx_mp_users
  # POST /wx_mp_users.json
  def create
    @wx_mp_user = current_user.wx_mp_users.new(wx_mp_user_params)

    respond_to do |format|
      if @wx_mp_user.save
        format.html { redirect_to wx_mp_users_url, notice: 'Wx mp user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wx_mp_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @wx_mp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wx_mp_users/1
  # PATCH/PUT /wx_mp_users/1.json
  def update
    respond_to do |format|
      if @wx_mp_user.update(wx_mp_user_params)
        format.html { redirect_to wx_mp_users_url, notice: 'Wx mp user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wx_mp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wx_mp_users/1
  # DELETE /wx_mp_users/1.json
  def destroy
    @wx_mp_user.destroy
    respond_to do |format|
      format.html { redirect_to wx_mp_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wx_mp_user
      @wx_mp_user = WxMpUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wx_mp_user_params
      params.require(:wx_mp_user).permit(:supplier_id, :status, :name, :uid, :token, :url, :welcome_msg, :description)
    end
end
