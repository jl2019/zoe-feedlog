class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :name
      t.string :status
      t.string :owner

      t.timestamps
    end
  end
end
