require 'rails_helper'

feature 'user browsing main page' do
  let!(:teacher) { User.create(email: 'phil@gmail.com', password: 'password', first_name: 'Phil', last_name: 'Huang', image_path: 'https://d1avok0lzls2w.cloudfront.net/img_uploads/too-thin-0.jpg') }
  let!(:team_1) { Team.create(teacher: teacher, name: 'Phys Ed') }
  let!(:team_2) { Team.create(teacher: teacher, name: 'Health') }
  let!(:student) { Student.create(team: team_1, first_name: 'Jane', last_name: 'Huang', gender: 'female', image_path: 'https://pbs.twimg.com/profile_images/3716740999/dd8689883ff0a0c040f354811f095e33.jpeg', grade: 'junior', gpa: 3.8, number_of_detentions: 10, shirt_size: 'm', food_allergies: 'gluten') }

  scenario 'sees a list of users' do
    visit '/students'
    expect(page).to have_text("Team")
  end

  xscenario 'when user clicks on add student to team button' do

  end
end