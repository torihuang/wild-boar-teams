class TeamsController < ApplicationController
  def update
    team_id = params[:id]
    student_id = params[:student_id]
    team = Team.find_by(id: team_id)
    student = Student.find_by(id: student_id)
    if team && student
      if team.allow_update(student)[0] == true
        student.update(team_id: team_id)
        if request.xhr?
          render 'students/_summary', locals: {student: student}, layout: false
          # student.team.name
        else
          redirect_to "/students"
        end
      else
        render '422'
      end
    else
      puts student_id
      puts team_id 
      render '404'
    end
  end
end
