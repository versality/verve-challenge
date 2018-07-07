class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_url
      t.string :name
      t.string :producer
      t.string :region
      t.integer :product_id
      t.float :price_in_usd
      t.boolean :in_stock, default: true

      t.timestamps
    end
  end
end
