class Transaction < ApplicationRecord
    belongs_to :user
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
    belongs_to :account
    validates :account, presence: true

    TRANSACTION_TYPES = ['Depósito', 'Saque', 'Transferência']

    def self.ransackable_attributes(auth_object = nil)
        %w[account_id action amount created_at description id source_account_id target_account_id transaction_type updated_at user_id]
      end
end