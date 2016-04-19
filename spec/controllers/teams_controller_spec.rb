require 'rails_helper'

describe TeamsController do
  let!(:teacher) { User.create(email: 'phil@gmail.com', password: 'password', first_name: 'Phil', last_name: 'Huang', image_path: 'https://d1avok0lzls2w.cloudfront.net/img_uploads/too-thin-0.jpg') }
  let!(:team_1) { Team.create(teacher: teacher, name: 'Phys Ed') }
  let!(:team_2) { Team.create(teacher: teacher, name: 'Health') }
  let!(:student) { Student.create(team: team_1, first_name: 'Jane', last_name: 'Huang', gender: 'female', image_path: 'https://pbs.twimg.com/profile_images/3716740999/dd8689883ff0a0c040f354811f095e33.jpeg', grade: 'junior', gpa: 3.8, number_of_detentions: 10, shirt_size: 'm', food_allergies: 'gluten') }

  xit 'routes to "update" on the teams controller' do
    expect(update: teams_path).to route_to(controller: "teams", action: "update")
  end

  xit 'changes the student team on update' do
    put update: "/teams/#{team_2.id}/students/#{student.id}"
    # teams_path, params { team_id: team_2.id, student_id: student.id }
    # , student: {team: team_2}
    expect(student.team).to eq(team_2)
  end
end