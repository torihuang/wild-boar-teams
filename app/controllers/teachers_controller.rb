class TeachersController < ApplicationController
  before_action :authenticate!

  def list
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students
  end

  def new
  end

  def create
    @teachers  = Teachers.new(params[:teachers])

    if @teachers.save
      redirect_to teachers
    else
      render 'create'
    end
  end

  def edit
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :password, :image_route, :email)
    end
end
