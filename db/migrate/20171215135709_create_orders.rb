class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, primary_key: "order_id"do |t|
      t.references :customer, foreign_key: true
      t.string :note
      t.string :status

      t.timestamps
    end
  end
end
