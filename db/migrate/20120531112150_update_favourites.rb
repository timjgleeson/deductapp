class UpdateFavourites < ActiveRecord::Migration
  def up
    add_column :favourites, :transaction_type, :integer, :default => 1
  end

  def down
  end
end
