require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do 
    it 'renders the new page' do 
      get :new, params: {}

      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end 
  end 

  describe "GET #index" do 
    it 'renders the index page' do 
      get :index, params: {} 

      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end 
  end 

  describe "POST #create" do 
    context 'with invalid params' do 
      it 'checks for email and password' do 
        post :create, params: { user: { email: "alexdetmering@gmail.com"} }

        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end 
    end 

    it 'checks if password is 6 characters long' do 
      post :create, params: {user: {email: "alexdetmering@gmail.com", password: "1234"}}

      expect(response).to render_template(:new)
      expect(flash[:errors]).to be_present
    end 

    context 'with valid params' do 
      it 'redirects to user show page' do 
        post :create, params: { user: { email: "alexdetmering@gmail.com", password: "1234567" } }

        expect(response).to redirect_to(user_url(User.find_by(email: "alexdetmering@gmail.com")))
      end 
    end 
  end 

  
 

  

end
