class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.references :agent, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
