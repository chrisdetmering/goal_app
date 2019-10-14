require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url 
    expect(page).to have_content "Sign Up!" 
  end 

  scenario 'shows username on the homepage after signup' do 
    visit new_user_url 
    fill_in 'Email:', with: "new_user@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
    expect(page).to have_content "new_user@gmail.com"
  end 
end

feature 'Logging in and out' do
  background(:each) do 
    visit new_user_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
  end 

  scenario 'login has a login page' do 
    visit new_session_url 
    expect(page).to have_content "Login!"
  end 

  scenario 'login shows username on the current page after login' do 
    visit new_session_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Login!'
    expect(page).to have_content "alexdetmering@gmail.com"
  end 


  scenario 'logout begins with a logged out state' do 
    visit new_user_url
    expect(page).to have_no_content "Logout"
  end 

  scenario 'logout doesn\'t show username on the homepage after logout' do
    visit new_session_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Login!'
    click_on 'Logout'
    expect(page).not_to have_content "alexdetmering@gmail.com"
  end 
end 