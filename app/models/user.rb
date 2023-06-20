class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :transactions
  has_many :transfer_transactions, foreign_key: :target_account_id, class_name: 'Transaction'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, presence: true
end
