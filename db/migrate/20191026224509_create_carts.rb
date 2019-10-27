class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total, precision: 6, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
