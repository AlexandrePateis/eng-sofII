class UpdateAAccount < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :accounts, :users
    add_foreign_key :accounts, :users, on_delete: :cascade
  end
end
