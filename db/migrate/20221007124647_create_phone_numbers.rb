class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :telephone_number, null: false
      t.integer :sale_status, null: false
      t.datetime :freeze_date

      t.timestamps
    end
  end
end
