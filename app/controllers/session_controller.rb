class SessionController < ApplicationController

  skip_before_action :authorize, only: [:create, :new]

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      puts "logging in"
      log_in @user
      redirect_to students_path
    else
      @errors = ["Invalid Credentials"]
      render partial: 'login', locals: {errors: @errors}
    end
  end

  def new
    @user = User.new
    if request.xhr?
      render partial: 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end

end
