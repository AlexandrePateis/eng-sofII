# spec/models/transaction_spec.rb
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user: user) }

    it 'is valid with a positive amount and a destination account' do
      transaction = build(:transaction, user: user, account: account, amount: 100)
      expect(transaction).to be_valid
    end

    it 'is invalid with a negative amount' do
      transaction = build(:transaction, user: user, account: account, amount: -100)
      expect(transaction).not_to be_valid
    end

    it 'is invalid without a destination account' do
      transaction = build(:transaction, user: user, account: nil, amount: 100)
      expect(transaction).not_to be_valid
    end
  end
end
