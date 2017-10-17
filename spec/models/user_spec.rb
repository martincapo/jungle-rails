require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user_params = {
            first_name: 'test',
            last_name: 'test',
            email: 'test@test.com',
            password: '1234',
            password_confirmation: '12345'
          }
  end

  describe 'Validations' do
    # validation tests/examples here

    it 'is invalid if password and password_confirm not matching' do

      user = User.create(@user_params)
      expect(user.valid?).to be false
    end

    it 'should not be allowed if email is in the database' do
      user1 = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')
      user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')

      expect(user.valid?).to be false
    end

    it 'is invalid without a first name' do
      user = User.create(first_name: nil, last_name: 'test', email: 'test@test.com', password: '1234')

      expect(user.valid?).to be false
    end

    it 'is invalid without a last name' do
      user = User.create(first_name: 'test', last_name: nil, email: 'test@test.com', password: '1234')

      expect(user.valid?).to be false
    end
    it 'is invalid without a email' do
      user = User.create(first_name: 'test', last_name: 'test', email: nil, password: '1234')

      expect(user.valid?).to be false
    end

    it 'is invalid if password is too short' do
      user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')

      expect(user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
  # examples for this class method here
    it 'is valid user' do
      user = User.create(first_name: 'test', last_name: 'test', email: 'TEST@test.com', password: '12345678')

      userAuth = User.authenticate_with_credentials('test@test.com', '12345678')

      expect(userAuth).to eq(user)
    end

    it 'is NOT valid user' do
      user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')

      userAuth = User.authenticate_with_credentials('test@test.com', '1')

      expect(userAuth).to eq(nil)
    end

    it 'is valid email even if has whitespace' do
      user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '12345678')

      userAuth = User.authenticate_with_credentials(' test@test.com ', '12345678')

      expect(userAuth).to eq(user)
    end

    it 'is email case_insensitive' do
      user = User.create(first_name: 'test', last_name: 'test', email: 'eXample@domain.COM', password: '12345678')

      userAuth = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '12345678')

      expect(userAuth).to eq(user)
    end


  end

end
