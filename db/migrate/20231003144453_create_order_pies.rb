class CreateOrderPies < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_pies do |t|
      t.references :pie, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.integer :quantity
      t.string :toppings

      t.timestamps
    end
  end
end
