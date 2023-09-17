require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(
      email: 'john@example.com',
      password: 'password123'
    )
    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(
      name: 'John Doe',
      password: 'password123'
    )
    expect(user).not_to be_valid
  end

  it 'is invalid without a password' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com'
    )
    expect(user).not_to be_valid
  end

  it 'is invalid with a name longer than 50 characters' do
    user = User.new(
      name: 'A' * 51,
      email: 'john@example.com',
      password: 'password123'
    )
    expect(user).not_to be_valid
  end
end
