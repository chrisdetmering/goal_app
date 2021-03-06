# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  cheers          :integer
#

class User < ApplicationRecord
  include Commentable

  attr_reader :password 

  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true
 
  has_many :goals 
  

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return user if user && user.is_password?(password)
    nil
  end 

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end 

  def generate_session_token 
    SecureRandom.urlsafe_base64(16)
  end 

  def reset_session_token! 
    self.session_token = generate_session_token
    self.save!

    self.session_token
  end 

  def ensure_session_token 
   self.session_token ||= generate_session_token
  end 

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end 
end
