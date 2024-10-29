class CreateCartitems < ActiveRecord::Migration[7.1]
  def change
    create_table :cartitems do |t|
      t.integer :qty
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
