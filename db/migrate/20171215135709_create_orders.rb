class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.string :note
      t.string :status

      t.timestamps
    end
  end
end
