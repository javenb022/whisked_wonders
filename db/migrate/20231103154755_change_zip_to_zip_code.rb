class ChangeZipToZipCode < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :zip, :zip_code
  end
end
