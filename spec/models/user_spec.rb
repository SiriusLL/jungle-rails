require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.new
      params = {
      first_name: 'Johny',
      last_name: 'Black-Beard',
      email: 'Johnny.pirate@bay.com',
      password: '12345',
      password_confirmation: '12345'
      }
      expect(User.new(params)).to be_valid
      # expect(@user.errors).not_to include("field ")
    end
    it 'should not create a user if first_name is missing' do
      @user = User.new
      params = {
      first_name: nil,
      last_name: 'Black-Beard',
      email: 'Johnny.pirate@bay.com',
      password: '12345',
      password_confirmation: '12345'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if last_name is missing' do
      @user = User.new
      params = {
      first_name: 'johnny',
      last_name: nil,
      email: 'Johnny.pirate@bay.com',
      password: '12345',
      password_confirmation: '12345'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if email is missing' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: '12345',
      password_confirmation: '12345'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if password is missing' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: nil,
      password_confirmation: '12345'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if password_confirmation is missing' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: '12345',
      password_confirmation: nil
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if password is less than 5 characters' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: '123456',
      password_confirmation: '123456'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if password_confirmation is less than 5 characters' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: '123456',
      password_confirmation: '123456'
      }
      expect(User.new(params)).not_to be_valid
    end
    it 'should not create a user if password_confirmation and password do not match' do
      @user = User.new
      params = {
      first_name: 'Johnny',
      last_name: 'Black-Beard',
      email: nil,
      password: '123456',
      password_confirmation: '1234567'
      }
      expect(User.new(params)).not_to be_valid
    end

  end
  describe '.authenticate_with_credintials' do
    it 'should authenticate with credentials and return authenticated user' do
      user = User.create(first_name: 'Darwin', last_name: 'Stuarte', email: 'test@test.test', password: '123456', password_confirmation: '123456')
      authenticated_user = User.authenticate_with_credentials('test@test.test', '123456')
      expect(authenticated_user).to eq(user)
    end
    it 'should authenticate with credentials and return authenticated user if user has spaces before and after email' do
      user = User.create(first_name: 'Darwin', last_name: 'Stuarte', email: 'test@test.test', password: '123456', password_confirmation: '123456')
      authenticated_user = User.authenticate_with_credentials(' test@test.test ', '123456')
      expect(authenticated_user).to eq(user)
    end
    it 'should authenticate with credentials and return authenticated user if user has wrong case email' do
      user = User.create(first_name: 'Darwin', last_name: 'Stuarte', email: 'test@test.test', password: '123456', password_confirmation: '123456')
      authenticated_user = User.authenticate_with_credentials('tEST@test.test', '123456')
      expect(authenticated_user).to eq(user)
    end
  end
end
