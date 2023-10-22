class AddDefaultValueToRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :role, "customer")
  end
end
