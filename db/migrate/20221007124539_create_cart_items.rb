class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false
      t.integer :phone_number_id, null: false
      

      t.timestamps
    end
  end
end
