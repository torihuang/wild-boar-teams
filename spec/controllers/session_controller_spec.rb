require 'rails_helper'

  describe SessionController do
    let!(:teacher) { User.create(email: 'phil@gmail.com', password: 'password', first_name: 'Phil', last_name: 'Huang', image_path: 'https://d1avok0lzls2w.cloudfront.net/img_uploads/too-thin-0.jpg') }

    feature 'prevents unauthorized users from viewing pages besides login' do
      before do
        session[:user_id] = nil
      end

      it 'redirects unauthorized user from students page to login page' do
        visit '/students'
        expect(current_path).to eql(root_path)
      end

      it 'redirects unauthorized user from teachers page to login page' do
        visit '/users'
        expect(current_path).to eql(root_path)
      end

      it 'successfully loads login page' do
        visit '/'
        expect(page.status_code).to be(200)
      end
    end

    describe 'allows users to login with valid credentials' do

      it 'will create new session with valid credentials' do
        post :create, :session => { email: teacher.email, password: teacher.password}
        expect(session[:user_id]).to_not be_nil
      end

      it 'redirects to student page with valid credentials' do
        post :create, :session => { email: teacher.email, password: teacher.password}
        expect(session).to redirect_to students_path
      end

      it 'will not create new session with invalid credentials' do
        post :create, :session => { email: teacher.email, password: "bad_password"}
        expect(assigns(:teacher)).to be_nil
      end

      it 'redirects to login page with invalid credentials' do
        post :create, :session => { email: teacher.email, password: "bad_password"}
        expect(session).to render_template('new')
      end
    end

    describe 'allows logged in users to log out' do
      it 'redirects to login page when log out link is clicked' do
        get :destroy
        expect(session).to redirect_to(root_url)
      end

      it 'clears the session' do
        get :destroy
        expect(session[:user_id]).to be_nil
      end
    end

  end
