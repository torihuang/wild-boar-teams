class SessionController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      log_in @user
      redirect_to
    else
      @errors = ["Invalid Credentials"]
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
