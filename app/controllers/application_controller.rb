class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # include ExceptionLogger::ExceptionLoggable
  # rescue_from Exception, :with => :log_exception_handler

  # before_filter :set_current_user
  before_filter :required_sign_in, :set_current_user

  private

  def current_user
    @current_user ||= Supplier.where(id: session[:supplier_id]).first
  end
  helper_method :current_user

  def required_sign_in
    unless current_user
      flash[:alert] = "你还没有登录，请先登录..."
      store_location
      redirect_to sign_in_path
    end
  end

  def set_current_user
    Supplier.current = current_user
  end

  def clear_sign_in_session
    session[:supplier_id] = nil
  end

  def store_location
    # session[:return_to] = request.referrer
    session[:return_to] = request.path unless request.path == '/'
  end

  def redirect_to_target_or_default(default = '/', *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  def deny_access
    flash[:alert] = "您没有权限进行此操作！如有问题请与技术部联系."
    redirect_to_target_or_default
  end
end
