class CreatePies < ActiveRecord::Migration[7.0]
  def change
    create_table :pies do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :estimated_time

      t.timestamps
    end
  end
end
