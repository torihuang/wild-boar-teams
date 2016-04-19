require 'rails_helper'

describe Team do
  let(:team) {Team.new(teacher_id: 1, name: 'Team Awesome')}

  it 'has a name and teacher id' do
    expect(team).to have_attributes(:teacher_id => 1, :name => "Team Awesome")
  end
end