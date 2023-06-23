class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :transactions
  has_many :transfer_transactions, foreign_key: :target_account_id, class_name: 'Transaction'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, presence: true
end
