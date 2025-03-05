class RemoveArtisantIdFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :artisan_id, :integer
  end
end
