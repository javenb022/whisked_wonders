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

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name} #{user.last_name}!"
      redirect_to root_path
    elsif User.exists?(email: params[:user][:email])
      flash[:error] = "That email already exists with an account."
      redirect_to new_user_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = "Passwords do not match."
      redirect_to new_user_path
    else
      flash[:error] = "A problem occurred: Please fill in all fields."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :address,
      :city,
      :state,
      :zip_code,
      :email,
      :password,
      :password_confirmation
    )
  end
end