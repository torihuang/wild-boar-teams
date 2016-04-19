require 'rails_helper'

describe Student do
  let(:student) { Student.new(
    team_id: 1,
    first_name: "Amy",
    last_name: "Student",
    gender: "female",
    image_path: Faker::Avatar.image,
    grade: "ninth",
    gpa: 3.5,
    number_of_detentions: 5,
    shirt_size: "medium",
    food_allergies: "peanuts"
    ) }

  before do
    student.save
  end

  describe "create" do
    it "makes a Student object" do
      student_1 = Student.new
      expect(student_1).to have_attributes(
        team_id: nil,
        first_name: nil,
        last_name: nil,
        gender: nil,
        image_path: nil,
        grade: nil,
        gpa: nil,
        number_of_detentions: nil,
        shirt_size: nil,
        food_allergies: nil)
    end

    describe "validations" do
      it "raises an error for a missing team id" do
        student_incomplete = Student.new(
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing first name" do
        student_incomplete = Student.new(
          team_id: 1,
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing last name" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing gender" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing grade" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing GPA" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          number_of_detentions: 5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing number of detentions" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          shirt_size: "medium",
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing shirt size" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          food_allergies: "peanuts")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end

      it "raises an error for a missing food allergies" do
        student_incomplete = Student.new(
          team_id: 1,
          first_name: "Amy",
          last_name: "Student",
          gender: "female",
          image_path: Faker::Avatar.image,
          grade: "ninth",
          gpa: 3.5,
          number_of_detentions: 5,
          shirt_size: "medium")
        # can make this specific by 'raise_error.with_message("whatever")'
        expect(student_incomplete).to be_invalid
      end
    end
  end

  describe "assocations" do
    before do
      user = User.new(
        email: "test@something.com",
        password: "password",
        first_name: "test",
        last_name: "user",
        image_path: Faker::Avatar.image
      )
      user.save
      team = user.build_team(name: "chartreuse")
      team.save
    end

    describe "team associations" do
      it "has a team" do
        expect(student.team).to have_attributes(name: "chartreuse")
      end

      it "has no more than one team" do
        team1 = user.build_team(name: "heliotrope")
        team1.save
        student.team = team1
        expect(student.team.count).to eq(1)
      end
    end

    describe "teacher association" do
      it "has a teacher" do
        expect(student.teach).to be(user)
      end
    end
  end
end