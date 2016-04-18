class TeamsController < ApplicationController
  def update
    team_id = params[:team_id]
    student_id = params[:student_id]
    puts "teamid: #{params[:team_id]}"
    puts "studentid: #{params[:student_id]}"
    team = Team.find_by(id: team_id)
    student = Student.find_by(id: student_id)
    if team && student
      puts "student.team_id: #{student.team}"
      student.update(team_id: team_id)
      if request.xhr?
        render 'students/summary'
      else
        redirect_to "/students"
      end
    else
      render '404'
    end
  end

  # private

  # def team_params
  #   params.require(:team).permit(:team_id, :student_id)
  # end
end
