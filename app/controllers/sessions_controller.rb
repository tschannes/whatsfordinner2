class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      session[:user_id] = user.id
      redirect_to user, :notice => "Welcome back, #{user.email}"
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    sign_out
    redirect_to root_path, :notice => "You have signed out"
  end
end
