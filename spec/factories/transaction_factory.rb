FactoryBot.define do
    factory :transaction do
      association :account
      amount { 50 }
    end
  end