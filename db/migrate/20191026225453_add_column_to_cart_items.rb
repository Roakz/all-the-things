class AddColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :item_total, :decimal, precision: 6, scale: 2
  end
end
