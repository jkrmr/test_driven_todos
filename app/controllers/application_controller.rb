class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate
    redirect_to new_session_url unless signed_in?
  end

  def signed_in?
    session[:current_email].present?
  end

  def sign_in(user)
    session[:current_email] = user.email
  end

  def current_user
    @current_user ||= User.find_by(email: session[:current_email])
  end
end
