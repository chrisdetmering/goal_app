# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ApplicationRecord 
  validates :body, presence: true 

  belongs_to :goal
end 
