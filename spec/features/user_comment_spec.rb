require 'rails_helper'
require 'spec_helper'

feature 'User comments' do 
   
  background(:each) do 
    visit new_user_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
  end 

  background(:each) do 
    user = User.find_by(email: 'alexdetmering@gmail.com')
    visit user_url(user)
    fill_in 'Comment:', with: 'What is up?!'
    click_on 'comment'
  end 

  scenario 'user show page should have comment button' do 
    user = User.find_by(email: 'alexdetmering@gmail.com')
    visit user_url(user)
    expect(page).to have_button('comment')

  end 

  scenario 'user show page should list all user\'s comments' do 
    user = User.find_by(email: 'alexdetmering@gmail.com')
    visit user_url(user)

    expect(page).to have_content "What is up?!"
  end 

end 