class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.string :name
      t.decimal :amount
      t.text :description
      t.integer :budget_id
      t.integer :user_id

      t.timestamps
    end
  end
end
