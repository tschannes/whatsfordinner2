class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.points = 0
    if @user.save
      sign_in @user
      redirect_to root_path, :notice => "You successfully registered!"
    else
      render "users/new", :notice => "Something went wrong!"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to products_url, :notice => "Profile was successfully updated"
    else
      render "show"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, :notice => "Deleted!"
  end

end
