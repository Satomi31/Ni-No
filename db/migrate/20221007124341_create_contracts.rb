class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.integer :customer_id, null: false
      t.integer :phone_number_id, null: false
      t.boolean :is_under_contract, null: false, default: true
      t.datetime :termination_date

      t.timestamps
    end
  end
end
