class ChangeDateFormatInPayments < ActiveRecord::Migration[5.1]
  def change
    change_column :payments, :date , :date
  end
end
