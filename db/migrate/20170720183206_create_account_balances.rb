class CreateAccountBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :account_balances do |t|
      t.integer :spreadsheetRow
      t.time :uploadedTime
      t.date :uploadedDate
      t.integer :amount
      t.references :bank_account, foreign_key: true

      t.timestamps
    end
  end
end
