class TeacherController < ApplicationController
  def list
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
  end

  def create
    @teachers  = Teachers.new(params[:teachers ]) #create new teachers

    if @teachers.save
      redirect_to teachers
    else
      @errors = @teacher.errors.full_messages
      render 'create'
    end
  end

  end

  def edit
  end

  def update
  end

  def delete

  end

  private
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :password, :image_route, :email)
    end
end
