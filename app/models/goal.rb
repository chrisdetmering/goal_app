# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :text             not null
#  user_id     :integer          not null
#  description :string           not null
#  completed   :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  private?    :boolean          default("false")
#

class Goal < ApplicationRecord 
  validates :title, :user_id, :description, presence: true 

  belongs_to :author, 
    class_name: 'User',
    foreign_key: :user_id

  has_many :comments, 
    class_name: 'GoalComment', 
    foreign_key: :goal_id
    
end 
