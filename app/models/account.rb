class Account < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :transactions, dependent: :destroy

    validates :account_number, uniqueness: true

  before_create :set_account_number

  def set_account_number
    last_account_number = Account.maximum(:account_number)&.to_i || 999
    self.account_number = (last_account_number + 1).to_s
  end

end
