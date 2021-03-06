class UsersController < ApplicationController
  def new; end

  def show
    render file: '/public/401' unless current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}"
      redirect_to dashboard_path
    elsif params[:password] != params[:password_confirmation]
      flash[:failure] = 'Password and Password Confirmation fields did not match.'
      render :new
    else
      flash[:failure] = user.errors.full_messages.first
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
