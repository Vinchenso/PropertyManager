class CreateAccountBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :account_balances do |t|
      t.time :uploadedTime
      t.date :uploadedDate
      t.decimal :amount
      t.references :bank_account, foreign_key: true

      t.timestamps
    end
  end
end
