require 'rails helper'

describe User do
  let(:user){ User.new(
    email: "test@something.com", 
    password: "password",
    first_name: "test",
    last_name: "user",
    image_path: Faker::Avatar.image 
    )}

  before do
    user.save
  end

  describe "user creation" do
    it "creates a User object" do
      expect(user).to have_attributes(
        email: "test@something.com", 
        password: "password",
        first_name: "test",
        last_name: "user",
        image_path: Faker::Avatar.image)
    end

    describe "validations" do
      it "raises an error for a duplicate email" do
        user2 = User.new(
          email: "test@something.com", 
          password: "password",
          first_name: "duplicate",
          last_name: "testUser",
          image_path: Faker::Avatar.image)
        # can make this specific by 'raise_error.with_message("whatever")'
        expect{ user2.save }.to raise_error
      end
    end
  end

  describe "assocations" do
    before do
      team = user.build_team(name: "chartreuse")
      team.save
    end

    describe "team associations" do
      it "has a team" do 
        expect(user.team).to have_attributes(name: "chartreuse")
      end

      it "has no more than one team" do
        team1 = user.build_team(name: "heliotrope")
        team1.save
        expect(user.team.count).to eq(1)
      end
    end

    describe "student associations" do
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
        expect(user.students).to include(amy)
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
        expect(user.students.count).to equal(2)
      end
    end
  end  
end