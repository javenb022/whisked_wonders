class RemoveAboutMeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :about_me
  end
end
