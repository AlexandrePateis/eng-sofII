class MakeBallanceAccountAgain < ActiveRecord::Migration[7.0]
  def up
    change_column :accounts, :balance, :decimal
  end

  def down
    change_column :accounts, :balance, :float
  end
end
