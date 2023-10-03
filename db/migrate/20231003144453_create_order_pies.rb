class CreateOrderPies < ActiveRecord::Migration[7.0]
  def change
    create_table :order_pies do |t|
      t.references :pies, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true
      t.integer :quantity
      t.string :toppings

      t.timestamps
    end
  end
end
