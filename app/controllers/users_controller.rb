class UsersController < ApplicationController

  skip_before_action :authorize, only: [:create, :new]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @students = @user.students
    @all_students = Student.all
  end

  def new
    @user = User.new

    if request.xhr?
      render partial: 'new'
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
      else
        @errors = @user.errors.full_messages
        render :new
      end
    else
      @errors = ["Could not verify master password. Please contact your administrator."]
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
      params.require(:user).permit(:first_name, :last_name, :password, :image_path, :email)
    end
end
