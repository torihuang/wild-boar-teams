require 'rails helper'

describe Team do
  let(:user){ User.new(
    email: "test@something.com", 
    password: "password",
    first_name: "test",
    last_name: "user",
    image_path: Faker::Avatar.image 
    )}

  before do
    user.save
    @team = user.build_team(name: "magenta")
    @team.save
  end

  describe "team creation" do
    it "creates a Team object" do
      expect(@team).to have_attributes(name: "magenta")
    end
  end

  describe "assocations" do
    describe "teacher association" do
      it "has a teacher" do 
        expect(@team.teacher).to be(user)
      end
    end

    describe "student association" do
      before do 
        amy = Student.create!(
          team_id: team.id,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts"
          )
      end

      it "has students" do
        expect(@team.students).to include(amy)
      end

      it "may have many students" do
        sid = Student.create!(
          team_id: team.id,
          first_name: "Sid",
          last_name: "Student",
          gender: "male",
          image_path: Faker::Avatar.image,
          grade: "twelfth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts"
          )
        expect(@team.students.count).to equal(2)
      end
    end
  end  
end