require 'rails_helper'
require 'spec_helper'

feature 'Goal comments' do 

  background(:each) do 
    visit new_user_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
  end 

  background(:each) do 
    user = User.find_by(email: "alexdetmering@gmail.com")
    visit user_url(user)
    click_link 'New Goal'
    fill_in 'Title', with: 'Make Dinner'
    fill_in 'Description', with: 'Make dinner for Sarah'
    check("goal_private")
    check("goal_completed")
    click_button "New Goal"
  end 
 
  scenario 'goal has comment button' do 
    user = User.find_by(email: "alexdetmering@gmail.com")
    visit user_url(user)
    click_link 'Make Dinner'
    expect(page).to have_button('comment')
  end 

  scenario 'should list all the goal\'s comments' do 
    fill_in 'Comment:', with: "This goal is lame"
    click_button 'comment'
    expect(page).to have_content("This goal is lame")
  end 
end 