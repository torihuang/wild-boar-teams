class TeamsController < ApplicationController
  def update
    # p "hello world"
    team_id = params[:id]
    student_id = params[:student_id]
    puts "team_id: #{team_id}"
    puts "student_id: #{student_id}"
    team = Team.find_by(id: team_id)
    student = Student.find_by(id: student_id)
    puts student
    puts team
    if team && student
      student.update(team_id: team_id)
      if request.xhr?
        render 'students/_summary', locals: {student: student}, layout: false
        # student.team.name
      else
        redirect_to "/students"
      end
    else
      render '404'
    end
  end
end
