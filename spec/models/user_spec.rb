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

require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject(:user) do 
      User.create!( 
        email: "chrisdetmering@gmail.com", 
        password: "1234567"
      )
  end 


  
  #validations
  #email presence 
  #password_digest
  #password (length: 6) 
  
  describe 'validations' do 
    it { should validate_presence_of(:email) } 
    it { should validate_uniqueness_of(:email)}
  end 

  #associations 
  describe 'associations' do 
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end 

  #class level methods 

  describe "::find_by_valid_credentials" do 
    it "Should find user with correct email and password" do 
    user = User.create(email: "chrisdet@gmail.com", password: "1234567")

    expect(User.find_by_valid_credentials("chrisdet@gmail.com", "1234567")).to eq(user)
    end 

    it "Should not find user with incorrect email and password" do 
    user = User.create(email: "chrisdet@gmail.com", password: "1234567")

    expect(User.find_by_valid_credentials("chrisdet1234@gmail.com", "1234567")).to_not eq(user)
    end 

  end 


  #encypting password 

  describe "password encryption" do 

    it "should encrypt the password" do 
      User.create(email: "chrisdet@gmail.com", password: "1234567")

      user = User.find_by(email: "chrisdet@gmail.com")
      expect(user.password).to_not eq("1234567")
    end 

    it "should use BCrypt" do 
      expect(BCrypt::Password).to receive(:create)

      User.new(email: "New_guy", password: "password")
    end 

  end 


  
end
