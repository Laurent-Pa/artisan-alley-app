class AddUserTypesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_type, :integer
  end
end
