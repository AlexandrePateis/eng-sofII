class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.string :account_number
      t.decimal :balance, precision: 8, scale: 2

      t.timestamps
    end
  end
end
