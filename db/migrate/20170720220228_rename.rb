class Rename < ActiveRecord::Migration[5.1]
  def change
   rename_column :bank_accounts, :class, :account_klass 
  end
end
