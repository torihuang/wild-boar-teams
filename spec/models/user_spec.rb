require 'rails_helper'

describe User do
  let(:user){ User.new(
    email: "test@something.com",
    password: "password",
    first_name: "test",
    last_name: "user",
    image_path: Faker::Avatar.image
    )}

  let(:image_path) {user.image_path}

  before do
    user.save
  end

  describe "creation" do
    it "makes a User object" do
      expect(user).to have_attributes(
        email: "test@something.com",
        password: "password",
        first_name: "test",
        last_name: "user",
        image_path: image_path)
    end

    describe "validations" do
      it "raises an error for a duplicate email" do
        user_2 = User.new(
          email: "test@something.com",
          password: "password",
          first_name: "duplicate",
          last_name: "testUser",
          image_path: Faker::Avatar.image)
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(user_2).to be_invalid
      end
    end
  end

  describe "assocations" do
    before do
      team = user.build_team(name: "chartreuse")
      team.save
    end

    it "has a team" do
      expect(user.team).to have_attributes(name: "chartreuse")
    end

    it "has no more than one team" do
      team1 = user.build_team(name: "heliotrope")
      team1.save
      expect(user.team).to be_a_kind_of(Team)
    end

    describe "in relation to students" do
      before do
        team = user.build_team(name: "chartreuse")
        team.save

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

      it "exist" do
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