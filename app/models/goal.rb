# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :text             not null
#  user_id     :integer          not null
#  description :string           not null
#  private     :boolean          default("false")
#  completed   :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ApplicationRecord 
  validates :title, :user_id, :description, presence: true 

  belongs_to :author, 
    class_name: 'User',
    foreign_key: :user_id
    
end 
