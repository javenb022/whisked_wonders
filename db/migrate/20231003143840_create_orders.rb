class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :completed, default: false
      t.integer :status, default: 0
      t.string :expected_delivery_time
      t.string :name
      t.integer :delivery_method
      t.string :additional_info

      t.timestamps
    end
  end
end
