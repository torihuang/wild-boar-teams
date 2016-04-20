class UsersController < ApplicationController
  # before_action :authenticate!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @students = @user.students
  end

  def new
    @user = User.new
  end

  def create
    @user  = User.new(params[:teachers])

    if @user.save
      redirect_to users
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    puts "yoo"
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :image_route, :email)
    end
end
