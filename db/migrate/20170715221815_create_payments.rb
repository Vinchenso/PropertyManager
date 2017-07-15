class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.datetime :date
      t.integer :amount
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end
