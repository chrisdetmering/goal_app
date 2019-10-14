# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserComment < ApplicationRecord 
  validates :body, presence: true 

  belongs_to :user
end 
