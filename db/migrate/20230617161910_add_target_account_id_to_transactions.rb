class AddTargetAccountIdToTransactions < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :transactions, :accounts
  end

  def down
    add_foreign_key :transactions, :accounts
  end
end
