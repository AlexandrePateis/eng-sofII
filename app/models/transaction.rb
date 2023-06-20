class Transaction < ApplicationRecord
    belongs_to :user
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
    belongs_to :account
    validates :account, presence: true
end