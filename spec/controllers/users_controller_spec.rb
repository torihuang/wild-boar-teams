require 'rails_helper'

describe UsersController do

  RSpec.describe "GET #index" do
    # let!(:teachers) {[User.create!(email: "ooo@yahoo.com", password: "password",first_name: "Bryan",
    #   last_name: "Cage",image_path: "photo url"), User.create!(email: "ddd@yahoo.com", password: "password",first_name: "Byron",
    #     last_name: "Gage",image_path: "photo url"), User.create!(email: "ccc@yahoo.com", password: "password",first_name: "Brian",
    #       last_name: "Guage",image_path: "photo url")]}
    # let!(:teachers) { users }
    it "assigns all users to @users" do
      teachers_array = [User.create!(email: "ooo@yahoo.com", password: "password",first_name: "Bryan",
        last_name: "Cage",image_path: "photo url"), User.create!(email: "ddd@yahoo.com", password: "password",first_name: "Byron",
          last_name: "Gage",image_path: "photo url"), User.create!(email: "ccc@yahoo.com", password: "password",first_name: "Brian",
            last_name: "Guage",image_path: "photo url")]
      get :index, user_path
      expect(assigns(:users)).to eq(teachers_array)
    end
  end

  # describe "GET index" do
  #   it "assigns @users" do
  #     user = User.create!(email: "p@yahoo.com", password: "password",first_name: "Bryan")
  #     get :index
  #     expect(assigns(:user)).to eq([user])
  #   end
  #
  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end

  describe "GET #show" do
    let!(:teacher) { User.create!(email: "z@yahoo.com", password: "password",first_name: "Byron",
      last_name: "Gage",image_path: "photo url") }
    it "assigns the requested user as @teacher" do
      get :show, { id: teacher.id }
      expect(assigns(:teacher)).to eq(@teaher)
    end
  end

  # describe "GET #edit" do
  #   it "takes the user to an edit form" do
  #     get :edit
  #     expect(response).to redirect_to(root_url)
  #   end
  # end

  describe "GET edit" do
  it "it takes the user to an edit form" do
  get :edit, {id: 1}
  expect(@user).to redirect_to(root_url)
 end
end

  describe "GET #create" do
    let!(:teacher) { User.create!(email: "ss@yahoo.com", password: "password",first_name: "Sarah",
      last_name: "Smith",image_path: "photo url") }
    it "it edits the users information" do
      post :create, :user => { last_name: "Smith" }
      expect(teacher.last_name).to eq("Smith")
    end
  end




end
