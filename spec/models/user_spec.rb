require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, email, and password' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without name' do
    user = User.new(email: 'john@example.com', password: 'password')
    expect(user).not_to be_valid
  end

  it 'is invalid without email' do
    user = User.new(name: 'John Doe', password: 'password')
    expect(user).not_to be_valid
  end

  it 'is invalid without password' do
    user = User.new(name: 'John Doe', email: 'john@example.com')
    expect(user).not_to be_valid
  end
end
