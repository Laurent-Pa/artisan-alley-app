class RemoveColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_type, :string
  end
end
