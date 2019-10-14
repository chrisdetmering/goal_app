require 'rails_helper'
require 'spec_helper'

feature 'CRUD of goals' do 
  
  background(:each) do 
    visit new_user_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
  end 

   background(:each) do 
      visit new_goal_url 
      fill_in 'Title', with: 'Make Dinner'
      fill_in 'Description', with: 'Make dinner for Sarah'
      check("goal_private")
      check("goal_completed")
      click_button "New Goal"

      visit new_goal_url 
      fill_in 'Title', with: 'Go to Bed'
      fill_in 'Description', with: 'Go to bed with Sarah'
      check("Private?")
      check("Completed?")
      click_button "New Goal"
    end 

  feature 'Create new goal' do 
    scenario 'has form for making a new goal' do 
      visit new_goal_url 
      expect(page).to have_content 'New Goal'
    end 

    scenario 'should display new goal after creation' do 
      visit new_goal_url 
      fill_in 'Title', with: 'Make Dinner'
      fill_in 'Description', with: 'Make dinner'
      click_button "New Goal"
      expect(page).to have_content('Make Dinner')
    end 
  end
   
  feature 'Reading goals' do 
    scenario 'should list all user goals' do 
      user = User.find_by(email: "alexdetmering@gmail.com")
      visit user_url(user)
      expect(page).to have_content "Make Dinner"
      expect(page).to have_content "Go to Bed"
    end 
  end 

  feature 'Updating goals' do 
    scenario 'user page should have update button' do 
      user = User.find_by(email: "alexdetmering@gmail.com")
      visit user_url(user)
      expect(page).to have_button "Ops didn't complete"

    end 

    scenario 'update button should update goal' do 
      user = User.find_by(email: "alexdetmering@gmail.com")
      visit user_url(user)
    end 
   
  end 


end 