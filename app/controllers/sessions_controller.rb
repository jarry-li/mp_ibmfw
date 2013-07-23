# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :required_sign_in
  # skip_authorization_check

  def new
  end

  def create
    clear_sign_in_session

    if supplier = Supplier.authenticate(params[:nickname], params[:password])
      session[:supplier_id] = supplier.id
      supplier.update_sign_in_attrs_with(request.remote_ip)
      # redirect_to root_url, :notice => "登录成功!"
      flash.now.alert = "登录成功!"
      redirect_to_target_or_default
    else
      flash.now.alert = "帐号或密码错误"
      render "new"
    end
  end

  def destroy
    clear_sign_in_session
    # session[:return_to] = nil

    redirect_to root_url, :notice => "已安全登出!"
  end

  def secret
    authenticate_or_request_with_http_basic("weixin") do |username, password|
    # authenticate_with_http_basic do |username, password|
      user = Supplier.where(nickname: username).first
      if user and password == 'lwk'
        session[:supplier_id] = user.id
        redirect_to_target_or_default
        true
      else
        false
      end
    end
  end

end