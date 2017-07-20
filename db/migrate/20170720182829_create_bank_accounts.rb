class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :institution
      t.string :type
      t.string :class
      t.integer :zapier_index
      t.string :account_number

      t.timestamps
    end
  end
end
