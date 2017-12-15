class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, primary_key: "payment_id" do |t|
      t.references :order, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :amounts
      t.date :payment_date
      t.string :payment_method
      t.string :note

      t.timestamps
    end
  end
end
