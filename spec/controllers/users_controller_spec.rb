require 'rails_helper'

describe UsersController do
  before do
    user = User.create(email: "yellow@yahoo.com", password: "password",first_name: "Daniel",
      last_name: "Cage",image_path: "photo url")
    session[:user_id] = user.id
  end

  describe 'GET #index' do
    it "assigns all users to @users" do
      teachers_array = [User.create!(email: "ooo@yahoo.com", password: "password",first_name: "Bryan",
        last_name: "Cage",image_path: "photo url"), User.create!(email: "ddd@yahoo.com", password: "password",first_name: "Byron",
          last_name: "Gage",image_path: "photo url"), User.create!(email: "ccc@yahoo.com", password: "password",first_name: "Brian",
            last_name: "Guage",image_path: "photo url")]

      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "GET #show" do
    let!(:teacher) { User.create!(email: "z@yahoo.com", password: "password",first_name: "Byron",
      last_name: "Gage",image_path: "photo url") }
    it "assigns the requested user as @user" do
      get :show, { id: teacher.id }
      expect(assigns(:user)).to eq(teacher)
    end
  end

  describe "GET edit" do
    let!(:teacher) { User.create!(email: "z@yahoo.com", password: "password",first_name: "Byron",
      last_name: "Gage",image_path: "photo url") }
    it "it takes the user to an edit form" do
    get :edit, {id: teacher.id}
    expect(assigns(@user)).to redirect_to(edit_user_path)
   end
  end

  describe "GET #create" do
    let!(:teacher) { User.create!(email: "ss@yahoo.com", password: "password",first_name: "Sarah",
      last_name: "Smith",image_path: "photo url") }
    it "it edits the users information" do
      post :create, :user => { last_name: "Smith" }
      expect(assigns(:user).last_name).to eq(assigns(:user))
    end
  end

end
