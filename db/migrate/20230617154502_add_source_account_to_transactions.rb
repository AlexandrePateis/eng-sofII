class AddSourceAccountToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :source_account, foreign_key: { to_table: :accounts }
  end
end
