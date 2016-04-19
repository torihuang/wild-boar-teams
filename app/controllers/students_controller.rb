# student1 = Student.create(first_name: 'lissie', last_name: 'huang', gender: 'female', image_path: 'x', grade: 'freshman', gpa: 123, number_of_detentions: 5, shirt_size: 's', food_allergies: 'none')
# student2 = Student.create(first_name: 'lissie', last_name: 'huang', gender: 'female', image_path: 'x', grade: 'freshman', gpa: 123, number_of_detentions: 5, shirt_size: 's', food_allergies: 'none')
# students = [student1, student2]

# render

class StudentsController < ApplicationController
require 'bigdecimal'

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def import
    # Student.import(params[:file])
    # redirect_to '/students'
  end

  def upload
    Student.upload(params[:file])
    redirect_to '/'
  end
end
