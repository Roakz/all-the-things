class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :quantity
      t.string :item
      t.decimal :price, precision: 6, scale: 2
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
