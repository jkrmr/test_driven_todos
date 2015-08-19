module SessionsHelper
  private

  def authenticate
    redirect_to new_session_url unless signed_in?
  end

  def signed_in?
    current_user.present?
  end

  def sign_in(user)
    session[:current_email] = user.email
  end

  def current_email
    session[:current_email]
  end

  def current_user
    @current_user ||= User.find_by(email: current_email)
  end
end
