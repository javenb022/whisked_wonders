class RemoveUserNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_name, :string
    change_column_null :users, :email, false
  end
end
