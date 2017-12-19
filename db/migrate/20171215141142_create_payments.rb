class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :order, index: true
      t.belongs_to :customer, index: true
      t.integer :amounts
      t.date :payment_date
      t.string :payment_method
      t.string :note

      t.timestamps
    end
  end
end
