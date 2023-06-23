class MakeBallanceAccount < ActiveRecord::Migration[7.0]
  def up
    change_column :accounts, :balance, :float
  end

  def down
    change_column :accounts, :balance, :decimal
  end
end
