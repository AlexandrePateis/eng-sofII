require 'rails_helper'

RSpec.describe Account, type: :model do
    let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password") }
  
    it "is valid with a user and non-negative initial balance" do
      account = Account.new(user: user, balance: 100)
      expect(account).to be_valid
    end
  
    it "is invalid without a user" do
      account = Account.new(balance: 100)
      expect(account).not_to be_valid
      expect(account.errors[:user]).to include("must exist")
    end
  
    it "is invalid with a negative initial balance" do
      account = Account.new(user: user, balance: -50)
      expect(account).not_to be_valid
      expect(account.errors[:balance]).to include("must be greater than or equal to 0")
    end
  end
  