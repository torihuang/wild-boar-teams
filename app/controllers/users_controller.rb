class UsersController < ApplicationController

  skip_before_action :authorize, only: [:create, :new]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
    @students = @user.students
    if @user.role == "admin" && @current_user.role == "teacher"
      redirect_to @current_user
    end
  end

  def new
    @user = User.new

    if request.xhr?
      @errors = []
      render partial: 'new_user', locals: {errors: @errors}
    end
  end

  def create
    new_params = params[:user].except(:master_password)
    @master_pass = MasterPass.first
    if @master_pass.authenticate(params[:user][:master_password])
      @user = User.new(user_params)
      @user.image_path = Faker::Avatar.image
      if @user.save
        new_team = @user.build_team(name: Faker::Commerce.color)
        new_team.save
        session[:user_id] = @user.id
        redirect_to @user
      elsif request.xhr?
        @errors = @user.errors.full_messages
        status 422
        render partial: 'new_user', locals: {errors: @errors}
      else
        @errors = @user.errors.full_messages
        render :new
      end
    elsif request.xhr?
      status 422
      @errors = ["Could not verify master password. Please contact your administrator."]
      render partial: 'new_user', locals: {errors: @errors}
    else
      @errors = ["Could not verify master password. Please contact your administrator."]
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :image_path, :email)
    end
end
