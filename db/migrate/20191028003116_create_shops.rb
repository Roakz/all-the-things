class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :content
      t.string :hook
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
