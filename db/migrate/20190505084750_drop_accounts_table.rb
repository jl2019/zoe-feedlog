class DropAccountsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :accounts
  end
end
