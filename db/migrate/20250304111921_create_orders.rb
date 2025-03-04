class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :ordered_quantity
      t.float :total_price

      t.timestamps
    end
  end
end
