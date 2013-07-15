module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
    cookies.permanent[:remember_token] = nil
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.where(remember_token: cookies[:remember_token]).first
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      redirect_to new_session_path, notice: "Please sign in."
    end
  end

  def is_admin?(user)
    user.role == "admin"
  end

end
