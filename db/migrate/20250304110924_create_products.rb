class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :artisan_id
      t.string :name
      t.string :adress
      t.string :description
      t.string :photo_id
      t.float :price
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
