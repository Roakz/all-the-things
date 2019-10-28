class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 5, scale: 2
      t.string :hook
      t.text :content
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
