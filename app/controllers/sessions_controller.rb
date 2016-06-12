class SessionsController < ApplicationController
  def new
    @notice = params[:notice]
  end

  def create
    @user = User.where(email: params[:session][:email]).take
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path, alert: "Bad mail/password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
