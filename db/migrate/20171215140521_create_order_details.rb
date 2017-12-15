class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details, primary_key: "order_detail_id" do |t|
      t.references :order, foreign_key: true
      t.references :good, foreign_key: true
      t.date :order_time
      t.integer :quantity
      t.integer :purchase_price
      t.integer :selling_price
      t.string :order_status

      t.timestamps
    end
  end
end
