class WxUsersController < ApplicationController
  before_action :set_wx_user, only: [:show, :edit, :update, :destroy]

  # GET /wx_users
  # GET /wx_users.json
  def index
    @wx_users = WxUser.all
  end

  # GET /wx_users/1
  # GET /wx_users/1.json
  def show
  end

  # GET /wx_users/new
  def new
    @wx_user = WxUser.new
  end

  # GET /wx_users/1/edit
  def edit
  end

  # POST /wx_users
  # POST /wx_users.json
  def create
    @wx_user = WxUser.new(wx_user_params)

    respond_to do |format|
      if @wx_user.save
        format.html { redirect_to @wx_user, notice: 'Wx user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wx_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @wx_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wx_users/1
  # PATCH/PUT /wx_users/1.json
  def update
    respond_to do |format|
      if @wx_user.update(wx_user_params)
        format.html { redirect_to @wx_user, notice: 'Wx user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wx_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wx_users/1
  # DELETE /wx_users/1.json
  def destroy
    @wx_user.destroy
    respond_to do |format|
      format.html { redirect_to wx_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wx_user
      @wx_user = WxUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wx_user_params
      params.require(:wx_user).permit(:uid)
    end
end
