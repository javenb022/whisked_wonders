class UsersController < ApplicationController
  def login_form; end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      redirect_to login_path
      flash[:error] = "A problem occurred: Email or password is incorrect."
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in."
      redirect_to root_path
    else
      redirect_to login_path
      flash[:error] = "A problem occurred: Email or password is incorrect."
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = "Successfully logged out"
  end
end