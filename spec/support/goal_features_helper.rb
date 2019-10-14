module GoalFeaturesHelper
  def submit_new_goal(goal_title, privacy = {private: false}, description = nil)
    visit new_goal_url 
    fill_in 'Title', with: goal_title
    if privacy[:private]
      check 'Private?'
    end

    if description.nil?
      fill_in 'Description', with: goal_title
    end 

    click_button "New Goal"
  end 
end