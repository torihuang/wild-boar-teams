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
    @users  = User.new(params[:teachers])

    if @users.save
      redirect_to teachers
    else
      render 'create'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:teacher).permit(:first_name, :last_name, :password, :image_route, :email)
    end
end
