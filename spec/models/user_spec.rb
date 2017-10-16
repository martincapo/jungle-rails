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

      user = User.new(@user_params)
      user.save
      expect(user.valid?).to be false
    end

    it 'should not be allowed if email is in the database' do
      user1 = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')
      user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234')

      puts user.errors.full_messages

      expect(user.valid?).to be false
    end

    it 'is invalid without a first name' do
      user = User.new(first_name: nil, last_name: 'test', email: 'test@test.com', password: '1234')
      user.save

      expect(user.valid?).to be false
    end

    it 'is invalid without a last name' do
      user = User.new(first_name: 'test', last_name: nil, email: 'test@test.com', password: '1234')
      user.save

      expect(user.valid?).to be false
    end
    it 'is invalid without a email' do
      user = User.new(first_name: 'test', last_name: 'test', email: nil, password: '1234')
      user.save

      expect(user.valid?).to be false
    end

  end


end
