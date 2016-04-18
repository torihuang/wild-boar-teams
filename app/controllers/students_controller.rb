# student1 = Student.create(first_name: 'lissie', last_name: 'huang', gender: 'female', image_path: 'x', grade: 'freshman', gpa: 123, number_of_detentions: 5, shirt_size: 's', food_allergies: 'none')
# student2 = Student.create(first_name: 'lissie', last_name: 'huang', gender: 'female', image_path: 'x', grade: 'freshman', gpa: 123, number_of_detentions: 5, shirt_size: 's', food_allergies: 'none')
# students = [student1, student2]

# render

class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

end
