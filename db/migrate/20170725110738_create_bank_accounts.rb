class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :institution
      t.string :account_type
      t.string :account_klass
      t.string :account_number
      t.integer :spreadsheet_index

      t.timestamps
    end
  end
end
