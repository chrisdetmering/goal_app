require 'rails_helper'
require 'spec_helper'

feature 'User comments' do 
   
  background(:each) do 
    visit new_user_url 
    fill_in 'Email:', with: "alexdetmering@gmail.com"
    fill_in 'Password:', with: "0001aaab"
    click_on 'Create!'
  end 

  scenario 'user show page should have comment button' do 
    user = User.find_by(email: 'alexdetmering@gmail.com')
    visit user_url(user)
    expect(page).to have_button('comment')

  end 

end 